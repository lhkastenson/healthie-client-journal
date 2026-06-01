FactoryBot.define do
  factory :provider do
    name { Faker::Name.full_name }
    email { Faker::Internet.unique.email }
  end
end
