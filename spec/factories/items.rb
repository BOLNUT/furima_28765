FactoryBot.define do
  factory :item do
    name {Faker::Lorem.sentence}
    text {Faker::Lorem.sentence}
    category_id {Faker::Number.between(from: 2, to: 11)}
    item_status_id {Faker::Number.between(from: 2, to: 6)}
    delivery_fee_id {Faker::Number.between(from: 2, to: 3)}
    prefecture_id {Faker::Number.between(from: 2, to: 48)}
    delivery_day_id {Faker::Number.between(from: 2, to: 4)}
    price {Faker::Number.between(from: 300, to: 9999999)}
    association :user 
  end
end
