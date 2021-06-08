FactoryBot.define do
  factory :connection do
    name { Faker::Quote.yoda }
    description { Faker::Quote.yoda }

    user { create :user }
  end
end
