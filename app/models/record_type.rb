class RecordType < ApplicationRecord
  ### INCLUDES
  ### DEFAULT SCOPE
  ### CONSTANTS
  SUBSYSTEM_NAME = 'Subsystem'
  SOLUTION_NAME = 'Solution'

  ### ATTR ACCESSORS
  ### ENUMS
  ### RELATIONS (belongs to, has_many, has_many through)
  belongs_to :user
  ### VALIDATIONS (validates, validate)
  validates :name, presence: true
  validate :skip_creation_of_system_columns

  ### CALLBACKS
  ### NESTED ATTRIBUTES
  ### SCOPES
  ### ACTS_AS..., GEOCODED_BY, AUTOSTRIP_ATTRIBUTES, ATTACHED FILES and other non-standard special keywords
  ### CLASS METHODS
  def self.subsystem_record_type
    find_by(name: SUBSYSTEM_NAME)
  end

  def self.solution_record_type
    find_by(name: SOLUTION_NAME)
  end

  ### PRIVATE CLASS METHODS
  ### INSTANCE METHODS
  ### PRIVATE METHODS

  def skip_creation_of_system_columns
    if (name == SUBSYSTEM_NAME && RecordType.where(name: SUBSYSTEM_NAME).exists?) ||
       (name == SOLUTION_NAME && RecordType.where(name: SOLUTION_NAME).exists?)
      errors.add(:base, "This is a system name that is already taken")
      return false
    end
  end
end
