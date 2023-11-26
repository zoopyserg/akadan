FactoryBot.define do
  factory :participation do
    user { create :user }
    conversation { create :conversation }
  end
end
