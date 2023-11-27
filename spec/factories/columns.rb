FactoryBot.define do
  factory :column do
    filter_solved_status { Column::ANY_SOLVED_STATUS }
  end
end
