FactoryBot.define do
  factory :assignment do
    title { "MyString" }
    skills { ["Javascript", "Ruby"] }
    points { 320 }
    budget { 500 }
    description { "MyText"}
    association :client, factory: :user
  end
end
