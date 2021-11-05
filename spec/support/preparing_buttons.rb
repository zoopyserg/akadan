def prepare_record_buttons
  create :connection_type, name: 'Subsystem', is_public: true
  create :connection_type, name: 'Irrelevant Because...', is_public: true
  create :connection_type, name: 'Subsystem', is_public: true
  create :connection_type, name: 'Is Solved By...', is_public: true
  create :connection_type, name: 'Extracted To...', is_public: true
  create :record_type, name: 'Subsystem', is_public: true
  create :record_type, name: 'Solution', is_public: true
end

RSpec.configure do |config|
  config.before(:each) do |test|
    prepare_record_buttons # if test.metadata[:records_index]
  end
end
