FactoryBot.define do

  factory :user do
    name                  {"tarou"}
    email                 {"sample@gmail.com"}
    password              {"a12345"}
    password_confirmation {"a12345"}
  end
end