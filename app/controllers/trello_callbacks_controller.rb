require 'jsonpath'

class TrelloCallbacksController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :parse_data
  before_action :update_labels

  def webhook
    skip_authorization

    Activity.create(
      user_name: @data['action']['memberCreator']['fullName'],
      user_avatar: @data['action']['memberCreator']['avatarHash'],
      action: WebhookConstants::ACTIONS[@data['action']['type']],
      target: WebhookConstants::TARGETS[@data['action']['type']],
      data: extract_data,
      idea: Idea.find_by_card_id(params[:id])
    )

    render nothing: true, status: 200
  end

  private

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
    labels = @data['model']['labels'] || []
    labels.each do |label_data|
      label = Label.where(trello_id: label_data['id']).first_or_initialize
      label.text = label_data['name']
      label.color = label_data['color']
      label.save
    end
  end
end
