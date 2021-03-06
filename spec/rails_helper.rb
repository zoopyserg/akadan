require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
require 'devise'
require 'sidekiq/testing'
require 'capybara-screenshot/rspec'
require "rspec/wait"
Sidekiq::Testing.inline!

Dir[Rails.root.join('spec', 'support', '**', '*.rb')].sort.each { |f| require f }

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end

RSpec.configure do |config|
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.include Devise::Test::IntegrationHelpers, type: :request
  config.include Rails.application.routes.url_helpers

  config.include FeaturesHelper, type: :feature
  config.use_transactional_fixtures = false
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!

  config.include ::Rails::Controller::Testing::TestProcess, :type => :controller
  config.include Devise::Test::IntegrationHelpers, type: :request
  config.include FactoryBot::Syntax::Methods

  config.before(:each) do |example|
    unless example.metadata[:do_not_create_data]
      create :record_type, :solution_record_type, is_public: true
      create :record_type, :subsystem_record_type, is_public: true
      create :connection_type, :subsystem_connection_type, is_public: true
      create :connection_type, :solution_connection_type, is_public: true
      create :connection_type, :extracted_to_connection_type, is_public: true
      create :connection_type, :irrelevant_because_connection_type, is_public: true
    end
  end
end
