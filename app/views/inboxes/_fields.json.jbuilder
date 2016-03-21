json.initial_fields(fields) do |field|
  json.extract! field, :id, :title, :description, :required, :sorting
  json.destroy_path field_path(field.inbox, field)
end

json.order_path order_fields_inbox_path(@inbox)
