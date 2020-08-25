FactoryBot.define do
  factory :user do
    nick_name             {"test"}
    email                 {"kkk@gmail.com"}
    password              {"00000000"}
    password_confirmation {password}
    family_name           {"田中"}
    first_name            {"太郎"}
    family_name_kana      {"タナカ"}
    first_name_kana       {"タロウ"}
    birth_date            {""}
  end
end