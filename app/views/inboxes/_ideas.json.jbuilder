json.initial_ideas(@ideas) do |idea|
  json.extract! idea, :id, :title, :description
  json.owned current_user.owns(idea)
  json.edit_path edit_idea_path(idea.inbox, idea)
  json.show_path idea_path(idea.inbox, idea)
  json.created_at idea.created_at.to_i
  json.user_name idea.user.name
  json.user_avatar idea.user.avatar
  json.fields do
    json.array! idea.field_values do |field_value|
      json.title field_value.field.title
      json.value field_value.value
    end
  end
end
