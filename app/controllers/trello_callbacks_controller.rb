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

  def extract_data
    case WebhookConstants::TARGETS[@data['action']['type']]
    when Activity.targets[:attachment]
      {
        name: @data['action']['data']['attachment']['name'],
        preview: @data['action']['data']['attachment']['previewUrl2x']
      }
    when Activity.targets[:checklist]
      { name: @data['action']['data']['checklist']['name'] }
    when Activity.targets[:checklist_item]
      {
        text: @data['action']['data']['checkItem']['name'],
        completed: @data['action']['data']['checkItem']['state'] == 'complete',
        checklist: @data['action']['data']['checklist']['name']
      }
    when Activity.targets[:comment]
      { text: @data['action']['data']['text'] }
    when Activity.targets[:label]
      {
        text: @data['action']['data']['text'],
        color: @data['action']['data']['value']
      }
    when Activity.targets[:member]
      { name: @data['action']['member']['fullName'] }
    end
  end
end
