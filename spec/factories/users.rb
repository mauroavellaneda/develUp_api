FactoryBot.define do
  factory :user do
    email { "client@mail.com" }
    password { "password" }
    password_confirmation { "password" }
  end
end
