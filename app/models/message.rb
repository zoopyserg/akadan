class Message < ApplicationRecord
  belongs_to :sender, class_name: 'User'
  belongs_to :conversation
  has_many :readings, dependent: :destroy
  has_many :users, through: :readings

  scope :latest_first, -> { order(created_at: :desc) }
end
