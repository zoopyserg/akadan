module RecordsHelper
  def subsystem_connection_type
    # todo: I18n
    ConnectionType.find_by(name: 'Subsystem')
  end

  def subsystem_record_type
    # todo: I18n
    RecordType.find_by(name: 'Subsystem')
  end

  def irrelevant_because_connection_type
    # todo: I18n
    ConnectionType.find_by(name: 'Irrelevant Because...')
  end
end
