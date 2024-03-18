FactoryBot.define do
  factory :user do
    transient do
      the_password { Faker::Internet.password }
      the_first_name { Faker::Name.first_name }
      the_last_name { Faker::Name.last_name }
      the_full_name { the_first_name + ' ' + the_last_name }
    end

    sequence(:first_name) { the_first_name }
    sequence(:last_name) { the_last_name }
    sequence(:username) {|n| Faker::Internet.username(separators: %w()) + n.to_s }
    sequence(:email) {|n| Faker::Internet.email(name: the_full_name + " #{n}") }
    password { the_password }
    password_confirmation { the_password }
    accept_terms { true }
    is_public { true }
    bio { [Faker::Hipster.sentence, "I am an expert in " + [Faker::Science.science, Faker::Hobby.activity].sample.downcase].sample }
    about { "I love " + (1..(rand(3) + 2)).collect { Faker::Hobby.activity.downcase }.join(', ') }

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
      after(:build) do |user|
        avatars_dir = Rails.root.join('lib', 'assets', 'avatars')
        avatar_files = Dir[avatars_dir.join('avatar_*.jpg')]
        random_avatar_file = File.open(avatar_files.sample)

        user.avatar.attach(io: random_avatar_file, filename: File.basename(random_avatar_file), content_type: 'image/jpeg')
      end
    end
  end
end
