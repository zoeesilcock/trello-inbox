json.ideas(@ideas) do |idea|
  json.extract! idea, :id, :title, :description
  json.owned current_user.owns(idea)
  json.edit_path edit_idea_path(idea.inbox, idea)
  json.created_at idea.created_at.to_formatted_s(:short)
  json.user_name idea.user.name
  json.user_avatar idea.user.avatar
end
