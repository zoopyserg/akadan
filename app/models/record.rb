class Record < ApplicationRecord
  belongs_to :user
  belongs_to :record_type
  has_many :dots, dependent: :destroy
  accepts_nested_attributes_for :dots
end
