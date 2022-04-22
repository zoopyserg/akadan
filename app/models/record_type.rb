class RecordType < ApplicationRecord
  ### INCLUDES
  ### DEFAULT SCOPE
  ### CONSTANTS
  ### ATTR ACCESSORS
  ### ENUMS
  ### RELATIONS (belongs to, has_many, has_many through)
  belongs_to :user
  ### VALIDATIONS (validates, validate)
  validates :name, presence: true
  ### CALLBACKS
  ### NESTED ATTRIBUTES
  ### SCOPES
  ### ACTS_AS..., GEOCODED_BY, AUTOSTRIP_ATTRIBUTES, ATTACHED FILES and other non-standard special keywords
  ### CLASS METHODS
  def self.subsystem_record_type
    find_by(name: 'Subsystem')
  end

  def self.solution_record_type
    find_by(name: 'Solution')
  end

  ### PRIVATE CLASS METHODS
  ### INSTANCE METHODS
  ### PRIVATE METHODS


end
