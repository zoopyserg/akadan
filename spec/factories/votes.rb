FactoryBot.define do
  factory :vote do
    user
    association :votable, factory: :comment
    vote_flag { true }
  end
end
