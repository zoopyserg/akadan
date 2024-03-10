class ConnectionType < ApplicationRecord
  ### INCLUDES
  include TriggerCProgram

  ### DEFAULT SCOPE
  ### CONSTANTS
  SUBSYSTEM_NAME = 'Subsystem'
  IS_SOLVED_BY_NAME = 'Is Solved By...'
  EXTRACTED_TO_NAME = 'Extracted To...'
  IRRELEVANT_BECAUSE_NAME = 'Irrelevant Because...'

  ### ATTR ACCESSORS
  ### ENUMS
  ### RELATIONS (belongs to, has_many, has_many through)
  belongs_to :user
  belongs_to :target_record_type, class_name: 'RecordType', optional: true
  belongs_to :target_record_subtype, class_name: 'RecordType', optional: true
  belongs_to :closest_parent_type, class_name: 'RecordType', optional: true

  ### VALIDATIONS (validates, validate)
  validates :name, presence: true
  validates :target_hierarchy, inclusion: { in: %w(all all_roots deep_siblings siblings) }
  validates :target_type, inclusion: { in: %w(any same_as_source specific_type specific_subtype) }
  validate :skip_creation_of_system_columns

  ### CALLBACKS
  ### NESTED ATTRIBUTES
  ### SCOPES
  ### ACTS_AS..., GEOCODED_BY, AUTOSTRIP_ATTRIBUTES, ATTACHED FILES and other non-standard special keywords
  ### CLASS METHODS
  def self.subsystem_connection_type
    find_by(name: SUBSYSTEM_NAME)
  end

  def self.solution_connection_type
    find_by(name: IS_SOLVED_BY_NAME)
  end

  def self.extracted_to_connection_type
    find_by(name: EXTRACTED_TO_NAME)
  end

  def self.irrelevant_because_connection_type
    find_by(name: IRRELEVANT_BECAUSE_NAME)
  end

  ### PRIVATE CLASS METHODS
  ### INSTANCE METHODS
  def any_target_type?
    target_type == 'any'
  end

  def target_type_same_as_source_type?
    target_type == 'same_as_source'
  end

  def target_specific_type?
    target_type == 'specific_type'
  end

  def target_specific_subtype?
    target_type == 'specific_subtype'
  end

  def hierarchy_siblings?
    target_hierarchy == 'siblings'
  end

  def hierarchy_all_parent_generations?
    target_hierarchy == 'all_parent_generations'
  end

  def hierarchy_deep_siblings?
    target_hierarchy == 'deep_siblings'
  end

  def hierarchy_all_tree_records?
    target_hierarchy == 'all_tree_records'
  end

  def hierarchy_all?
    target_hierarchy == 'all'
  end

  def hierarchy_all_roots?
    target_hierarchy == 'all_roots'
  end

  def hierarchy_root?
    target_hierarchy == 'root'
  end

  def hierarchy_parent_of_specific_type?
    target_hierarchy == 'specific_parent_type'
  end

  def hierarchy_closest_parent_of_type?
    target_hierarchy == 'closest_specific_parent_type'
  end

  def possible_records_b_by_type_for(user, record_a)
    if any_target_type?
      Record.accessible_record_bs(user, record_a)
    elsif target_type_same_as_source_type?
      Record.accessible_record_bs_by_type(user, record_a, record_a.record_type)
    elsif target_specific_type?
      Record.accessible_record_bs_by_type(user, record_a, target_record_type)
    elsif target_specific_subtype?
      Record.accessible_record_bs_by_subtype(user, record_a, target_record_type, target_record_subtype)
    end
  end

  def possible_records_b_for(user, record_a)
    if hierarchy_all?
      possible_records_b_by_type_for(user, record_a).without_potential_cycles(record_a)
    elsif hierarchy_all_roots?
      possible_records_b_by_type_for(user, record_a).all_roots_without_cycles(record_a)
    elsif hierarchy_siblings?
      possible_records_b_by_type_for(user, record_a).siblings(user, record_a).without_potential_cycles(record_a)
    # elsif hierarchy_deep_siblings?
    #   # todo: this one is not done yet, it requires all tree records
    #   # possible_records_b_by_type_for(user, record_a).deep_siblings(record_a)
    #   raise 'Not implemented yet'
    else
      possible_records_b_by_type_for(user, record_a).without_potential_cycles(record_a)
    end
  end

  ### PRIVATE METHODS

  private
  def skip_creation_of_system_columns
    if (name == SUBSYSTEM_NAME && ConnectionType.where(name: SUBSYSTEM_NAME).exists?) ||
       (name == IS_SOLVED_BY_NAME && ConnectionType.where(name: IS_SOLVED_BY_NAME).exists?) ||
       (name == EXTRACTED_TO_NAME && ConnectionType.where(name: EXTRACTED_TO_NAME).exists?) ||
       (name == IRRELEVANT_BECAUSE_NAME && ConnectionType.where(name: IRRELEVANT_BECAUSE_NAME).exists?)
      errors.add(:base, "This is a system name that is already taken")
      return false
    end
  end
end
