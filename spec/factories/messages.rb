FactoryBot.define do
  factory :message do
    body { 'my message' }

    sender { create :user }
    conversation { create :conversation }
  end
end
