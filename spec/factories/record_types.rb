FactoryBot.define do
  factory :record_type do
    name { Faker::Quote.yoda }
    description { Faker::Quote.yoda }
    is_public { false }

    user { create :user }

    trait :subsystem_record_type do
      name { 'Subsystem' }
    end

    trait :solution_record_type do
      name { 'Solution' }
    end
  end
end
