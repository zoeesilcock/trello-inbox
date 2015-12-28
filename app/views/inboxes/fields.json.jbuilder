json.initial_fields(@fields) do |field|
  json.extract! field, :id, :title, :description, :required, :order
end
