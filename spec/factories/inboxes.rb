FactoryGirl.define do
  factory :inbox do
    title 'Super sweet inbox'
    board_id 'trello_board_id'
    description 'A mighty fine inbox.'
    user
  end
end
