FactoryBot.define do
  factory :sensor do
    name { 'my sensor' }
    description { 'long and boring description' }

    user { create :user }
  end
end
