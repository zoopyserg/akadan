FactoryBot.define do
  factory :blocking do
    user { create :user }
    blocked_user { create :user }
  end
end
