FactoryBot.define do
  factory :group do
    association :record_b, factory: :record
    connection_type
    user
  end
end
