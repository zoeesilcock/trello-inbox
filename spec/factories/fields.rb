FactoryGirl.define do
  factory :field do
    title 'Solution'
    description 'Describe your suggested solution.'
    required false
    sorting 1
    inbox
  end
end
