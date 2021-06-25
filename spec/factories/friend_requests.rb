FactoryBot.define do
  factory :friend_request do
    user { create :user }
    friend { create :user }
  end
end
