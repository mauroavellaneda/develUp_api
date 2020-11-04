FactoryBot.define do
  factory :user do
    email { "user#{rand(0..999)}@mail.com"  }
    password { "password" }
    password_confirmation { "password" }
    role { "client" }
    company_name { "company name" }
    company_url { "http://develup.com" }
  end
end
