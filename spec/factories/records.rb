FactoryBot.define do
  factory :record do
    name { 'my repetitive problem' }
    description { 'long and boring description' }

    user { create :user }
  end
end
