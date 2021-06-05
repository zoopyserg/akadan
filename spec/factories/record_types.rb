FactoryBot.define do
  factory :record_type do
    name { 'my record type' }
    description { 'long and boring description' }

    user { create :user }
  end
end
