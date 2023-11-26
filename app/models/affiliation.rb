class Affiliation < ApplicationRecord
  ### INCLUDES
  ### DEFAULT SCOPE
  ### CONSTANTS
  ### ATTR ACCESSORS
  ### ENUMS
  ### RELATIONS (belongs to, has_many, has_many through)
  belongs_to :group
  belongs_to :record_a, class_name: 'Record'

  ### VALIDATIONS (validates, validate)
  ### CALLBACKS
  after_create :create_connection
  after_destroy :destroy_connection

  ### NESTED ATTRIBUTES
  ### SCOPES
  ### ACTS_AS..., GEOCODED_BY, AUTOSTRIP_ATTRIBUTES, ATTACHED FILES and other non-standard special keywords
  ### CLASS METHODS
  ### PRIVATE CLASS METHODS
  ### INSTANCE METHODS
  def create_connection
    if group.record_b && group.connection_type
      Connection.find_or_create_by name: 'Group Connection',
                                   description: '',
                                   is_public: true,
                                   record_a: record_a,
                                   record_b: group.record_b,
                                   connection_type: group.connection_type,
                                   group: group,
                                   user: group.user
    end
  end

  def destroy_connection
    Connection.where(record_a: record_a, record_b: group.record_b, group: group).destroy_all
  end
  ### PRIVATE METHODS
end
