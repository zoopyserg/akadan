class Column < ApplicationRecord
  ### INCLUDES
  ### DEFAULT SCOPE
  ### CONSTANTS
  ### ATTR ACCESSORS
  attr_accessor :persisted_column_id

  ### ENUMS
  enum filter_solved_status: {
    any: 0,
    solved: 1,
    unsolved: 2
  }

  ### RELATIONS (belongs to, has_many, has_many through)
  belongs_to :design
  belongs_to :record_type, optional: true

  ### VALIDATIONS (validates, validate)
  ### CALLBACKS
  ### NESTED ATTRIBUTES
  ### SCOPES
  ### ACTS_AS..., GEOCODED_BY, AUTOSTRIP_ATTRIBUTES, ATTACHED FILES and other non-standard special keywords
  ### CLASS METHODS
  ### PRIVATE CLASS METHODS
  ### INSTANCE METHODS
  ### PRIVATE METHODS
end
