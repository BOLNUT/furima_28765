FactoryBot.define do
  factory :user do
    nick_name              {"test"}
    email                 {"kkk@gmail.com"}
    password              {"00000000"}
    password_confirmation {password}
  end
end