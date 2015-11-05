FactoryGirl.define do
  factory :user do
    name "Test User"

    factory :creator do
      creator true
    end
  end
end
