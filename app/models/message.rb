class Message < ApplicationRecord
  ### INCLUDES
  ### DEFAULT SCOPE
  ### CONSTANTS
  ### ATTR ACCESSORS
  ### ENUMS
  ### RELATIONS (belongs to, has_many, has_many through)
  belongs_to :sender, class_name: 'User'
  belongs_to :conversation
  has_many :readings, dependent: :destroy
  has_many :users, through: :readings

  ### VALIDATIONS (validates, validate)
  validates :body, presence: true

  ### CALLBACKS
  ### NESTED ATTRIBUTES
  ### SCOPES
  scope :latest_first, -> { order(created_at: :desc) }

  ### ACTS_AS..., GEOCODED_BY, AUTOSTRIP_ATTRIBUTES, ATTACHED FILES and other non-standard special keywords
  ### CLASS METHODS
  ### PRIVATE CLASS METHODS
  ### INSTANCE METHODS
  ### PRIVATE METHODS
end
