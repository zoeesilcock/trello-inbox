FactoryGirl.define do
  factory :activity do
    user_name 'Some Awesome Person'
    user_avatar 'http://example.com/avatar.png'
    action_id 'trello_action_id'
    action 0
    target 0
    data 'What a great idea!'
  end
end
