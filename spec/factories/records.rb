FactoryBot.define do
  factory :record do
    name { Faker::Quote.yoda }
    description { Faker::Quote.yoda }

    user { create :user }
  end
end
