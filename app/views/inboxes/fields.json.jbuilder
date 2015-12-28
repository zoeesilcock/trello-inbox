json.initial_fields(@fields) do |field|
  json.extract! field, :id, :title, :description, :required, :order
  json.destroy_path field_path(field.inbox, field)
end
