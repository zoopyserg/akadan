FactoryBot.define do
  factory :message_chain do
    name { 'my message chain' }

    user { create :user }
  end
end
