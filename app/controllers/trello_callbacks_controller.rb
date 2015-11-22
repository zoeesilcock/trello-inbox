class TrelloCallbacksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def webhook
    skip_authorization
    @data = JSON.parse(request.body.read.html_safe)

    Activity.create(
      user_name: @data['action']['memberCreator']['fullName'],
      user_avatar: @data['action']['memberCreator']['avatarHash'],
      action: find_action,
      target: find_target,
      data: extract_data.to_json
    )

    render nothing: true, status: 200
  end

  def find_action
    case @data['action']['type']
    when 'addAttachmentToCard', 'addChecklistToCard', 'createCheckItem',
      'commentCard', 'addLabelToCard', 'addMemberToCard'
      Activity.actions[:added]
    when 'deleteAttachmentFromCard', 'removeChecklistFromCard',
      'deleteCheckItem', 'deleteComment', 'removeLabelFromCard',
      'removeMemberFromCard'
      Activity.actions[:removed]
    when 'updateCheckItemStateOnCard'
      Activity.actions[:updated]
    end
  end

  def find_target
    case @data['action']['type']
    when 'addAttachmentToCard', 'deleteAttachmentFromCard'
      Activity.targets[:attachment]
    when 'addChecklistToCard', 'removeChecklistFromCard'
      Activity.targets[:checklist]
    when 'createCheckItem', 'deleteCheckItem', 'updateCheckItemStateOnCard'
      Activity.targets[:checklist_item]
    when 'commentCard', 'deleteComment'
      Activity.targets[:comment]
    when 'addLabelToCard', 'removeLabelFromCard'
      Activity.targets[:label]
    when 'addMemberToCard', 'removeMemberFromCard'
      Activity.targets[:member]
    end
  end

  def extract_data
    case find_target
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
        completed: @data['action']['data']['checkItem']['state'] == 'complete'
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
