require 'capybara/rspec'
require 'rspec/retry'
# require 'capybara-screenshot/rspec'
require 'capybara/email/rspec'
require_relative 'support/features_helper'

RSpec.configure do |config|
  # config.include FeaturesHelpers # it works now as well

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
  config.filter_run_when_matching :focus
  config.example_status_persistence_file_path = "spec/examples.txt"
  config.disable_monkey_patching!
  config.default_formatter = "doc" if config.files_to_run.one?
  config.profile_examples = 10
  config.order = :random
  Kernel.srand config.seed
  config.verbose_retry = true
  config.display_try_failure_messages = true

  config.retry_callback = proc do |ex|
    if ex.metadata[:js]
      Capybara.reset!
    end
  end
end



