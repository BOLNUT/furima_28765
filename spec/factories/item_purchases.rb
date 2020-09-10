FactoryBot.define do
  factory :item_purchase do
    postcode      {"123-4567"}
    prefecture_id {Faker::Number.between(from: 2, to: 48)}
    city          {Faker::Lorem.sentence}
    block         {Faker::Lorem.sentence}
    building      {Faker::Lorem.sentence}
    phone_number  {"01234567890"}
  end
end
