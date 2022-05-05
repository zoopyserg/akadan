FactoryBot.define do
  factory :user do
    sequence(:first_name) {|n| Faker::Name.first_name }
    sequence(:last_name) {|n| Faker::Name.last_name }
    sequence(:username) {|n| "user#{n}name" }
    sequence(:email) {|n| "me#{n}@gmail.com" }
    password { '11111111' }
    password_confirmation { '11111111' }
    accept_terms { true }
    is_public { true }
    bio { Faker::Lorem.paragraph }
    about { Faker::Lorem.paragraph }

    trait :confirmed do
      confirmation_sent_at { Time.now }
      confirmed_at { Time.now }
    end

    trait :free do
      # premium is false by default inside migration
    end

    trait :premium do
      premium { true }
    end

    trait :with_avatar do
      avatar { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/images/me.jpg'), 'image/jpeg') }
    end
  end
end
