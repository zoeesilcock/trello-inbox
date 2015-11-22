module WebhookConstants
  ACTIONS = {
    'addAttachmentToCard' => Activity.actions[:added],
    'addChecklistToCard' => Activity.actions[:added],
    'createCheckItem' => Activity.actions[:added],
    'commentCard' => Activity.actions[:added],
    'addLabelToCard' => Activity.actions[:added],
    'addMemberToCard' => Activity.actions[:added],
    'deleteAttachmentFromCard' => Activity.actions[:removed],
    'removeChecklistFromCard' => Activity.actions[:removed],
    'deleteCheckItem' => Activity.actions[:removed],
    'deleteComment' => Activity.actions[:removed],
    'removeLabelFromCard' => Activity.actions[:removed],
    'removeMemberFromCard' => Activity.actions[:removed],
    'updateCheckItemStateOnCard' => Activity.actions[:updated]
  }

  TARGETS = {
    'addAttachmentToCard' => Activity.targets[:attachment],
    'deleteAttachmentFromCard' => Activity.targets[:attachment],
    'addChecklistToCard' => Activity.targets[:checklist],
    'removeChecklistFromCard' => Activity.targets[:checklist],
    'createCheckItem' => Activity.targets[:checklist_item],
    'deleteCheckItem' => Activity.targets[:checklist_item],
    'updateCheckItemStateOnCard' => Activity.targets[:checklist_item],
    'commentCard' => Activity.targets[:comment],
    'deleteComment' => Activity.targets[:comment],
    'addLabelToCard' => Activity.targets[:label],
    'removeLabelFromCard' => Activity.targets[:label],
    'addMemberToCard' => Activity.targets[:member],
    'removeMemberFromCard' => Activity.targets[:member]
  }
end
