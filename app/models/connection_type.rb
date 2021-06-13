class ConnectionType < ApplicationRecord
  belongs_to :user
  belongs_to :target_record_type, class_name: 'RecordType', optional: true
  belongs_to :target_record_subtype, class_name: 'RecordType', optional: true
  belongs_to :closest_parent_type, class_name: 'RecordType', optional: true

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
      possible_records_b_by_type_for(user, record_a)
    elsif hierarchy_all_roots?
      possible_records_b_by_type_for(user, record_a).all_roots
    elsif hierarchy_siblings?
      possible_records_b_by_type_for(user, record_a).siblings(user, record_a)
    elsif target_specific_subtype?
      Record.accessible_record_bs_by_subtype(user, record_a, target_record_type, target_record_subtype)
    end
  end
end
