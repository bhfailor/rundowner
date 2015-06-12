ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'codeclimate-test-reporter'
require 'minitest/rails'
require 'minitest/rails/capybara'
# Uncomment for awesome colorful output
# require 'minitest/pride'
require 'minitest/reporters'


SimpleCov.start do
  formatter SimpleCov::Formatter::MultiFormatter[
    SimpleCov::Formatter::HTMLFormatter,
    CodeClimate::TestReporter::Formatter
  ]
end
CodeClimate::TestReporter.start

class ActiveSupport::TestCase
  # Setup fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

reporter_optns = { color: true, slow_count: 5 }
Minitest::Reporters.use! [MiniTest::Reporters::SpecReporter.new(reporter_optns)]
