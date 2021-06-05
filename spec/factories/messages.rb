FactoryBot.define do
  factory :message do
    name { 'my message' }

    user { create :user }
  end
end
