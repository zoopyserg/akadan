FactoryBot.define do
  factory :dot do
    record { nil }
    description { Faker::Quote.yoda }
    start_date { "2021-06-10" }
    start_time { "2021-06-10 11:46:01" }
    end_date { "2021-06-10" }
    end_time { "2021-06-10 11:46:01" }
    income { "9.99" }
    duration { "2021-06-10 11:46:01" }
  end
end
