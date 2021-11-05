FactoryBot.define do
  factory :bookmark do
    user { create :user }
    record { create :record, is_public: true }
  end
end
