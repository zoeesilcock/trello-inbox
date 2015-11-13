FactoryGirl.define do
  factory :user do
    name 'Test User'

    factory :creator do
      creator true
    end

    factory :admin do
      admin true
    end
  end
end
