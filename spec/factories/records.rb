FactoryBot.define do
  factory :record do
    name { Faker::Quote.yoda }
    description { Faker::Quote.yoda }
    separate_project { false }

    user { create :user }
    record_type { create :record_type, user: user }
  end
end
