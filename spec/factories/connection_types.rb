FactoryBot.define do
  factory :connection_type do
    name { Faker::Quote.yoda }
    description { 'long and boring description' }
    is_public { false }

    user { create :user }
  end
end
