class Connection < ApplicationRecord
  ### INCLUDES
  include TriggerCProgram

  ### DEFAULT SCOPE
  ### CONSTANTS
  ### ATTR ACCESSORS
  ### ENUMS
  ### RELATIONS (belongs to, has_many, has_many through)
  belongs_to :user
  belongs_to :record_a, class_name: 'Record'
  belongs_to :record_b, class_name: 'Record'
  belongs_to :connection_type
  belongs_to :group, optional: true

  ### VALIDATIONS (validates, validate)
  ### CALLBACKS
  after_create :recalculate_cached_tree_counters

  ### NESTED ATTRIBUTES
  ### SCOPES
  ### ACTS_AS..., GEOCODED_BY, AUTOSTRIP_ATTRIBUTES, ATTACHED FILES and other non-standard special keywords
  ### CLASS METHODS
  ### PRIVATE CLASS METHODS
  ### INSTANCE METHODS
  def recalculate_cached_tree_counters
    CountersUpdateWorker.perform_async(record_a_id)
    CountersUpdateWorker.perform_async(record_b_id)
  end

  ### PRIVATE METHODS
end
