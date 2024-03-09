class Dot < ApplicationRecord
  ### INCLUDES
  include TriggerCProgram

  ### DEFAULT SCOPE
  ### CONSTANTS
  ### ATTR ACCESSORS
  ### ENUMS
  ### RELATIONS (belongs to, has_many, has_many through)
  belongs_to :user
  belongs_to :record
  belongs_to :project, class_name: 'Record'
  # todo: has_many photos
  # todo: has_many attachments

  ### VALIDATIONS (validates, validate)
  validates_presence_of :duration

  ### CALLBACKS
  ### NESTED ATTRIBUTES
  ### SCOPES
  ### ACTS_AS..., GEOCODED_BY, AUTOSTRIP_ATTRIBUTES, ATTACHED FILES and other non-standard special keywords
  ### CLASS METHODS
  ### PRIVATE CLASS METHODS
  ### INSTANCE METHODS
  ### PRIVATE METHODS
end
