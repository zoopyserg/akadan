FactoryBot.define do
  factory :record do
    name { Faker::Quote.yoda }
    separate_project { true }

    user { create :user }
    record_type { create :record_type, user: user }

    trait :with_dot do
      after(:build) { |r| create :dot, description: 'Description', record: r, project: r, user: r.user }
    end
  end
end
