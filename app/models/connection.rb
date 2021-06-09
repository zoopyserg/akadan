class Connection < ApplicationRecord
  belongs_to :user
  belongs_to :record_a, class_name: 'Record'
  belongs_to :record_b, class_name: 'Record'
  belongs_to :connection_type
end
