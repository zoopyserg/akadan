FactoryBot.define do
  factory :reading do
    read { false }

    user { create :user }
    message { create :message }
  end
end
