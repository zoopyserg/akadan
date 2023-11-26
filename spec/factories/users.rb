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
    sequence(:email) {|n| Faker::Internet.free_email(name: the_full_name + " #{n}") }
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
      remote_avatar_url {
        [
          Faker::LoremFlickr.image(search_terms: ['sports']),
          Faker::LoremFlickr.image(search_terms: ['fitness']),
          Faker::LoremFlickr.image(search_terms: ['person']),
          Faker::LoremFlickr.image(search_terms: ['cat']),
          Faker::LoremFlickr.image(search_terms: ['office']),
          Faker::LoremFlickr.image(search_terms: ['professional']),
          Faker::LoremFlickr.image(search_terms: ['worker']),
          Faker::LoremFlickr.image(search_terms: ['analyst']),
          Faker::LoremFlickr.image(search_terms: ['hero']),
          Faker::LoremFlickr.image(search_terms: ['photo']),
          Faker::LoremFlickr.image(search_terms: ['toy']),
          Faker::LoremFlickr.image(search_terms: ['seller']),
          Faker::LoremFlickr.image(search_terms: ['baker'])
        ].sample
      }
    end
  end
end
