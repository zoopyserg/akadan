FactoryBot.define do
  factory :record do
    name {
      [
        Faker::Hacker.say_something_smart,
        Faker::GreekPhilosophers.quote,
        Faker::Quote.yoda,
        Faker::Hobby.activity
      ].sample
    }
    separate_project { true }

    user { create :user, :confirmed }
    record_type { create :record_type, user: user }

    trait :with_dot do
      after(:build) { |r| create :dot, description: 'Description', record: r, project: r, user: r.user }
    end
  end
end
