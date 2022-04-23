FactoryBot.define do
  factory :comment do
    user
    association :commentable, factory: :record
    body { Faker::Lorem.paragraph }
  end
end
