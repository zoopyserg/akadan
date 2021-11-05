FactoryBot.define do
  factory :record_type do
    name { Faker::Quote.yoda }
    description { Faker::Quote.yoda }
    is_public { false }

    user { create :user }
  end
end
