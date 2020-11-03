FactoryBot.define do
  factory :user do
    email { "client@mail.com" }
    password { "password" }
    password_confirmation { "password" }
    role { "client" }
    company_name { "company name" }
    company_url { "http://develup.com" }
  end
end
