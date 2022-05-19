FactoryBot.define do
  factory :affiliation do
    group
    association :record_a, factory: :record
  end
end
