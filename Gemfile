source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.2'

gem 'rails', '~> 6.1.3', '>= 6.1.3.2'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'

gem 'high_voltage'

gem 'bootsnap', '>= 1.4.4', require: false

gem 'devise'
gem 'carrierwave'
gem 'kaminari'
gem 'cancancan'
gem 'sidekiq'
gem 'acts_as_votable'

group :development do
  gem 'web-console', '>= 4.1.0'
  # gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
  gem 'spring'
end

group :development, :staging do
  gem "letter_opener"
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# Testing
group :development, :test do
  gem 'rspec-rails'
  gem 'rails-controller-testing'
  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'parallel_tests'
end

group :test do
  gem 'capybara'
  # gem 'capybara-screenshot'
  gem 'selenium-webdriver'
  gem 'rexml'
  gem 'webdrivers'
  gem 'shoulda'

  # gem 'db-query-matchers'
  # gem 'webdrivers', '~> 4.2'
  gem 'capybara-selenium', '~> 0.0.6'
  gem 'capybara-email'
  gem 'capybara-screenshot'
  # gem 'webmock' # To test and check requests to external urls
  gem 'rspec-wait' # rspec helper to allow easily to wait for certain conditions. Super helpful in feature tests
  gem 'rspec-retry'
  # gem 'nacha', git: 'https://bitbucket.org/loop2080/nacha.git'
  gem 'database_cleaner-active_record'
end
