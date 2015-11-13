json.initial_users(@users) do |user|
  json.extract! user, :id, :name, :creator, :admin
end
