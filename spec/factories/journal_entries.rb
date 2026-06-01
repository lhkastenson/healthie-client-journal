FactoryBot.define do
  factory :journal_entry do
    association :client
    body { Faker::Lorem.paragraph }
  end
end
