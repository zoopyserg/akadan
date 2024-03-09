FactoryBot.define do
  factory :connection do
    name { Faker::Quote.yoda }
    description { Faker::Quote.yoda }

    user { create :user }

    record_a { create :record, user: user }
    record_b { create :record, user: user }
    connection_type { create :connection_type, user: user }
    is_public { Faker::Boolean.boolean }
  end
end
