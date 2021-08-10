class RecordType < ApplicationRecord
  belongs_to :user

  def self.subsystem_record_type
    @@subsystem_record_type ||= find_by(name: 'Subsystem')
  end

  def self.solution_record_type
    @@solution_record_type ||= find_by(name: 'Solution')
  end
end
