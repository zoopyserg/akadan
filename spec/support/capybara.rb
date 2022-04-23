require 'capybara'
require 'capybara/rspec'

CHROME_DOWNLOAD_DIR = "./tmp/chrome_downloads_#{Random.rand(99999)}".freeze

args = %w[disable-gpu
          no-sandbox
          window-size=1920,1080
          disable-popup-blocking
]

# note:
# Do not add any options unless you absolutely have to.
# Some of them break parallel tests.
# What was here:
# remote-debugging-port=9222
# blink-settings=imagesEnabled=false
# enable-features=NetworkService,NetworkServiceInProcess
# allow-file-access-from-files
# no-default-browser-check
# disable-dev-shm-usage
# disable-infobars

prefs = {
  # 'download.default_directory' => DownloadHelpers::PATH.to_s,
  'download.prompt_for_download' => false,
  'download.directory_upgrade' => true,
  'browser.set_download_behavior.behavior' => 'allow',
  'profile.default_content_settings.multiple-automatic-downloads' => 1,
  'profile.default_content_setting_values.automatic_downloads' => 1,
  'profile.password_manager_enabled' => false,
  'profile.default_content_settings.popups' => 0,
  'safebrowsing.enabled' => false,
  'safebrowsing.disable_download_protection' => true,
  'directory_upgrade' => true
}

Capybara.register_driver :selenium_chrome do |app|
  Capybara::Selenium::Driver.new app,
    browser: :chrome,
    clear_session_storage: true,
    clear_local_storage: true,
    capabilities: [Selenium::WebDriver::Chrome::Options.new(
      args: args,
      prefs: prefs
    )]
end

Capybara.register_driver :selenium_chrome_headless do |app|
  Capybara::Selenium::Driver.new app,
    browser: :chrome,
    clear_session_storage: true,
    clear_local_storage: true,
    capabilities: [Selenium::WebDriver::Chrome::Options.new(
      args: args + %w[headless],
      prefs: prefs
    )]
end

Capybara::Screenshot.register_driver(:selenium_chrome_headless) do |driver, path|
  driver.browser.save_screenshot(path)
end

Capybara.default_driver = :selenium_chrome_headless
Capybara.javascript_driver = :selenium_chrome_headless

RSpec.configure do |config|
  config.before(:each, type: :feature, js: true) do
    Capybara.current_driver = :selenium_chrome_headless
  end
end

# # Maybe Bitbucket fix
# Capybara.register_driver :headless_chrome do |app|
#   caps = Selenium::WebDriver::Remote::Capabilities.chrome
#   opts = Selenium::WebDriver::Chrome::Options.new
#
#   prefs =
#   opts.add_preference(:download, {
#       behavior: "allow",
#       prompt_for_download: false,
#       directory_upgrade: true,
#       default_directory: CHROME_DOWNLOAD_DIR
#     }
#   )
#   opts.add_preference(:profile, {
#     'default_content_settings' => { 'multiple-automatic-downloads': 1 }, # for chrome version olde ~42
#     'default_content_setting_values' => { 'automatic_downloads': 1 }, # for chrome newe 46
#     'password_manager_enabled' => false,
#     default_content_settings: { popups: 0 }
#     }
#   )
#
#   opts.add_preference(:safebrowsing, {
#     'enabled' => false,
#     'disable_download_protection' => true
#     }
#   )
#
#   opts.add_preference(:directory_upgrade, true)
#
#   chrome_args = %w[--headless --disable-infobars --no-sandbox  --disable-dev-shm-usage --disable-gpu --window-size=1388,768 --remote-debugging-port=9222 --allow-file-access-from-files --no-default-browser-check --disable-popup-blocking --disable-translate --blink-settings=imagesEnabled=false]
#   chrome_args.each { |arg| opts.add_argument(arg) }
#   Capybara::Selenium::Driver.new(app, browser: :chrome, options: opts, desired_capabilities: caps)
# end
#
# Capybara::Screenshot.register_driver(:headless_chrome) do |driver, path|
#   driver.browser.save_screenshot(path)
# end
#
# Capybara.default_driver = :headless_chrome
# Capybara.javascript_driver = :headless_chrome
