FactoryGirl.define do
  factory :label do
    text 'Cool label'
    color 'red'
    trello_id 'whatever_awesome_string_trello_provides'
  end
end
