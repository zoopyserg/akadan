FactoryBot.define do
  factory :connection_type do
    name { Faker::Quote.yoda }
    description { Faker::Quote.yoda }
    is_public { false }
    directional { false }
    destructive { false }
    target_type { :any }

    user { create :user }

    trait :specific_type do
      target_type { :specific_type }
      target_record_type { create :record_type }
    end
  end
end
