FactoryBot.define do
  factory :record do
    name { Faker::Quote.yoda }
    description { 'long and boring description' }

    user { create :user }
  end
end
