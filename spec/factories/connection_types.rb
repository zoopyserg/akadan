FactoryBot.define do
  factory :connection_type do
    name { 'my connection type' }
    description { 'long and boring description' }
    is_public { false }

    user { create :user }
  end
end
