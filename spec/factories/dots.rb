FactoryBot.define do
  factory :dot do
    record { nil }
    project { nil }
    user { nil }
    description { Faker::Quote.yoda }
    duration { 12345 }
  end
end
