ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'mocha/mini_test'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Code that need to be executed before each test
  def setup
    FileUtils.rm_rf('public/sites')
  end

  # Code that need to be executed after each test
  def teardown
    FileUtils.rm_rf('public/sites')
  end
end
