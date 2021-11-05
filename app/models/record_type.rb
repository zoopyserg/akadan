class RecordType < ApplicationRecord
  belongs_to :user

  validates :name, presence: true

  def self.subsystem_record_type
    find_by(name: 'Subsystem')
  end

  def self.solution_record_type
    find_by(name: 'Solution')
  end
end
