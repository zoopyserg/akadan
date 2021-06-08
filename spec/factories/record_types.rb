FactoryBot.define do
  factory :record_type do
    name { 'my record type' }
    description { 'long and boring description' }
    is_public { false }

    user { create :user }
  end
end
