FactoryBot.define do
  factory :user do
    email { "user#{rand(0..999)}@mail.com" }
    password { "password" }
    password_confirmation { "password" }
    factory :client do
      role { "client" }
      company_name { "company name" }
      company_url { "http://develup.com" }
    end
    factory :develuper do
      role { "develuper" }
      name { "MyName" }
      skills { ["Javascript", "Ruby"] }
      points { 320 }
      email { "develuper#{rand(0..999)}@mail.com" }
    end
  end
end
