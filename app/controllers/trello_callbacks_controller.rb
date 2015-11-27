require 'jsonpath'

class TrelloCallbacksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def webhook
    skip_authorization
    @data = JSON.parse(request.body.read.html_safe)

    Activity.create(
      user_name: @data['action']['memberCreator']['fullName'],
      user_avatar: @data['action']['memberCreator']['avatarHash'],
      action: WebhookConstants::ACTIONS[@data['action']['type']],
      target: WebhookConstants::TARGETS[@data['action']['type']],
      data: extract_data.to_json,
      idea: Idea.where(card_id: params[:id]).first
    )

    render nothing: true, status: 200
  end

  private

  def extract_data
    data = {}
    target = WebhookConstants::TARGETS[@data['action']['type']]

    WebhookConstants::DATA[target].each do |key, path|
      json_path = JsonPath.new(path)
      data[key] = json_path.on(@data).first
    end

    data
  end
end
