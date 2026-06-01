FactoryBot.define do
  factory :client do
    name { Faker::Name.full_name }
    email { Faker::Internet.unique.email }
  end
end
