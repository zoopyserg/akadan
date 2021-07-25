RSpec.configure do |config|
  config.before(:each) do |test|
    prepare_record_buttons if test.metadata[:records_index]
  end
end
