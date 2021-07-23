FactoryBot.define do
  factory :record do
    name { Faker::Quote.yoda }
    separate_project { true }

    user { create :user }
    record_type { create :record_type, user: user }
  end
end
