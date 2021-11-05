class Message < ApplicationRecord
  belongs_to :sender, class_name: 'User'
  belongs_to :conversation
  has_many :readings, dependent: :destroy
  has_many :users, through: :readings

  validates :body, presence: true

  scope :latest_first, -> { order(created_at: :desc) }
end
