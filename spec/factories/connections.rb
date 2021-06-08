FactoryBot.define do
  factory :connection do
    name { 'my connection' }
    description { 'long and boring description' }

    user { create :user }
  end
end
