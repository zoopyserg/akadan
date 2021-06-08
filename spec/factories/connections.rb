FactoryBot.define do
  factory :connection do
    name { Faker::Quote.yoda }
    description { 'long and boring description' }

    user { create :user }
  end
end
