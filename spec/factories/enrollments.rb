FactoryBot.define do
  factory :enrollment do
    association :provider
    association :client
    plan { %w[basic premium].sample }
  end
end
