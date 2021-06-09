class ConnectionType < ApplicationRecord
  belongs_to :user
  belongs_to :target_record_type, class_name: 'RecordType', optional: true
  belongs_to :target_record_subtype, class_name: 'RecordType', optional: true

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
end
