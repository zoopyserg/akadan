FactoryBot.define do
  factory :connections do
    name { 'my connection' }
    description { 'long and boring description' }

    user { create :user }
  end
end
