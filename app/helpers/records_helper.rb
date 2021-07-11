module RecordsHelper
  # todo: I18n for everything

  def subsystem_connection_type
    ConnectionType.find_by(name: 'Subsystem')
  end

  def solution_connection_type
    ConnectionType.find_by(name: 'Is Solved By...')
  end

  def extracted_to_connection_type
    ConnectionType.find_by(name: 'Extracted To...')
  end

  def irrelevant_because_connection_type
    ConnectionType.find_by(name: 'Irrelevant Because...')
  end

  def subsystem_record_type
    RecordType.find_by(name: 'Subsystem')
  end

  def solution_record_type
    RecordType.find_by(name: 'Solution')
  end
end
