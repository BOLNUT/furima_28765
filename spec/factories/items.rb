FactoryBot.define do
  factory :item do
    image {Faker::Lorem.sentence}
    name {Faker::Lorem.sentence}
    text {Faker::Lorem.sentence}
    category_id {Faker::Number.between(from: 2, to: 11)}
    item_status_id {Faker::Number.between(from: 2, to: 6)}
    delivery_fee_id {Faker::Number.between(from: 2, to: 3)}
    prefecture_id {Faker::Number.between(from: 2, to: 48)}
    delivery_day_id {Faker::Number.between(from: 2, to: 4)}

    association :user 
  end
end
