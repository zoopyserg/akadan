FactoryBot.define do
  factory :connection_type do
    name { Faker::Quote.yoda }
    description { Faker::Quote.yoda }
    is_public { false }
    directional { false }
    destructive { false }

    user { create :user }
  end
end
