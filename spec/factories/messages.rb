FactoryBot.define do
  factory :message do
    body { Faker::Quote.yoda }

    sender { create :user }
    conversation { create :conversation }
  end
end
