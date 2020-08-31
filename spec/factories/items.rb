FactoryBot.define do
  factory :item do
    image {Faker::Lorem.sentence}
    
    text {Faker::Lorem.sentence}
    association :user 
  end
end
