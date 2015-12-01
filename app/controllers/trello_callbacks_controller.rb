require 'jsonpath'

class TrelloCallbacksController < ApplicationController
  before_action :skip_authorization
  skip_before_action :verify_authenticity_token

  before_action :find_idea
  before_action :parse_data
  after_action :update_labels

  def webhook
    Activity.create(
      action_id: @data['action']['id'],
      user_name: @data['action']['memberCreator']['fullName'],
      user_avatar: @data['action']['memberCreator']['avatarHash'],
      action: WebhookConstants::ACTIONS[@data['action']['type']],
      target: WebhookConstants::TARGETS[@data['action']['type']],
      data: extract_data,
      idea: @idea
    )

    render nothing: true, status: 200
  end

  private

  def find_idea
    @idea = Idea.find(params[:id])
  end

  def parse_data
    @data = JSON.parse(request.body.read.html_safe)
  end

  def extract_data
    data = {}
    target = WebhookConstants::TARGETS[@data['action']['type']]

    WebhookConstants::DATA[target].each do |key, path|
      json_path = JsonPath.new(path)
      data[key] = json_path.on(@data).first
    end

    data.to_json
  end

  def update_labels
    IdeasLabel.where(idea_id: @idea.id).destroy_all

    labels = @data['model']['labels'] || []
    labels.each do |label_data|
      label = Label.where(trello_id: label_data['id']).first_or_initialize
      label.text = label_data['name']
      label.color = label_data['color']
      label.ideas << @idea
      label.save
    end
  end
end
