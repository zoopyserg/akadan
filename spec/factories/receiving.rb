FactoryBot.define do
  factory :receiving do
    read { false }

    user { create :user }
    message { create :message }
  end
end
