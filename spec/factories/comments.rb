FactoryGirl.define do
  factory :comment do
    action_id 'trello_action_id'
    user_name 'A super helpful person'
    user_avatar 'avatar_hash'
    text 'I have awesome things to say so I shall put them in a comment!'
    idea_id 1
  end
end
