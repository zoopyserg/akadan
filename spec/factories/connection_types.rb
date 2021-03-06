FactoryBot.define do
  factory :connection_type do
    name { Faker::Quote.yoda }
    description { Faker::Quote.yoda }
    is_public { false }
    directional { false }
    destructive { false }
    target_type { :any }
    target_hierarchy { :all }
    one_to_many { false }

    user { create :user }

    trait :specific_record_type do
      target_type { :specific_type }
      target_record_type { create :record_type }
    end

    trait :specific_subtype do
      target_type { :specific_subtype }
      target_record_type { create :record_type }
      target_record_subtype { create :record_type }
    end

    trait :specific_hierarchy_type do
      target_hierarchy { :closest_parent_of_type }
      closest_parent_type { create :record_type }
    end

    trait :solution_connection_type do
      name { 'Is Solved By...' }
    end

    trait :subsystem_connection_type do
      name { 'Subsystem' }
    end

    trait :extracted_to_connection_type do
      name { 'Extracted To...' }
    end

    trait :irrelevant_because_connection_type do
      name { 'Irrelevant Because...' }
    end

  end
end
