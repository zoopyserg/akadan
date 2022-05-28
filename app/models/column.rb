class Column < ApplicationRecord
  ### INCLUDES
  ### DEFAULT SCOPE
  ### CONSTANTS
  ANY_SOLVED_STATUS = 'any'
  SOLVED_STATUS = 'solved'
  UNSOLVED_STATUS = 'unsolved'

  ### ATTR ACCESSORS
  attr_accessor :persisted_column_id
  attr_accessor :page

  ### ENUMS
  enum filter_solved_status: {
    ANY_SOLVED_STATUS => 0,
    SOLVED_STATUS => 1,
    UNSOLVED_STATUS => 2
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
