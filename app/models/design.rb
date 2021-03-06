class Design < ApplicationRecord
  ### INCLUDES
  ### DEFAULT SCOPE
  ### CONSTANTS
  ### ATTR ACCESSORS
  ### ENUMS
  ### RELATIONS (belongs to, has_many, has_many through)
  belongs_to :user
  belongs_to :designable, polymorphic: true, optional: true
  has_many :columns, dependent: :destroy

  ### VALIDATIONS (validates, validate)
  ### CALLBACKS
  ### NESTED ATTRIBUTES
  accepts_nested_attributes_for :columns, allow_destroy: true

  ### SCOPES
  ### ACTS_AS..., GEOCODED_BY, AUTOSTRIP_ATTRIBUTES, ATTACHED FILES and other non-standard special keywords
  ### CLASS METHODS
  ### PRIVATE CLASS METHODS
  ### INSTANCE METHODS
  ### PRIVATE METHODS
end
