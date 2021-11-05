FactoryBot.define do
  factory :user_record_stat do
    user { nil }
    record { nil }
    records_connected_for_me_cached { 1 }
    records_connected_for_others_cached { "" }
    solved_records_connected_for_me_cached { 1 }
    solved_records_connected_for_others_cached { 1 }
    unsolved_records_connected_for_me_cached { 1 }
    unsolved_records_connected_for_others_cached { 1 }
  end
end
