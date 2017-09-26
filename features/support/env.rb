# frozen_string_literal: true
require 'bundler'
Bundler.require
require 'pry'
require 'rspec/matchers'
require 'rspec/expectations'
require 'capybara/cucumber'
require 'capybara-screenshot/cucumber'
require 'capybara/poltergeist'
require 'active_support/all'
require 'database_cleaner'
require 'factory_girl'

Capybara.register_driver :phantomjs do |app|
  options = {
    phantomjs_logger: File.open('phantom.log', 'w'),
    js_errors: true,
    inspector: true,
    extensions: [File.join(__dir__, 'disable_animations.js')],
    window_size: [1280, 768]
  }
  Capybara::Poltergeist::Driver.new(app, options)
end

Capybara.register_driver :selenium do |app|
  profile = Selenium::WebDriver::Firefox::Profile.from_name 'default'
  Capybara::Selenium::Driver.new(app, profile: profile)
end

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

Capybara.configure do |config|
  driver_name = ENV['DRIVER']
  default_driver = driver_name.empty? ? 'selenium' : driver_name
  config.default_driver = default_driver.to_sym
  config.javascript_driver = default_driver.to_sym
  config.default_max_wait_time = 10
  config.app_host = ENV['HOST'].nil? ? 'http://localhost:8100' : ENV['HOST']
end

Capybara::Screenshot.prune_strategy = :keep_last_run
Capybara::Screenshot.webkit_options = {width: 1024, height: 768}
Capybara.save_and_open_page_path = 'reports/screenshots'


##########To Cleanup the factoryGirl data

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each) do
    DatabaseCleaner.clean_with(:truncation)
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner[:mongo_mapper].strategy = :truncation
    DatabaseCleaner.start
  end

  config.after(:each) do
    FactoryGirl.reload
    Factory.reset_sequences
    DatabaseCleaner.clean
  end
end

