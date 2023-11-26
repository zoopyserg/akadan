FactoryBot.define do
  factory :sensor do
    name { Faker::Quote.yoda }
    description { Faker::Quote.yoda }
    is_public { false }

    user { create :user }
  end
end
