# Configure simeplecov for test coverage report
require 'simplecov'
SimpleCov.start do
  add_filter '/config/'
  add_group 'Controllers', 'app/controllers'
  add_group 'Helpers', 'app/helpers'
  add_group 'Mailers', 'app/mailers'
  add_group 'Models', 'app/models'
  add_group 'Overrides', 'app/overrides'
  add_group 'Libraries', 'lib'
  add_group 'Specs', 'spec'
end

# Configure Rails Environment
ENV['RAILS_ENV'] = 'test'

require File.expand_path('../dummy/config/environment.rb',  __FILE__)

require 'rspec/rails'
require 'capybara/rails'
require 'database_cleaner'
require 'ffaker'
require 'shoulda-matchers'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[File.join(File.dirname(__FILE__), 'support/**/*.rb')].each { |f| require f }

# Requires factories defined in spree_core
require 'spree/core/testing_support/factories'
require 'spree/core/testing_support/controller_requests'
require 'spree/core/url_helpers'

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods

  # == URL Helpers
  #
  # Allows access to Spree's routes in specs:
  #
  # visit spree.admin_path
  # current_path.should eql(spree.products_path)
  config.include Spree::Core::UrlHelpers
  config.include Spree::Core::TestingSupport::ControllerRequests

  # Set to false for running JS drivers.
  config.use_transactional_fixtures = false

  config.before :each do
    if example.metadata[:js]
      DatabaseCleaner.strategy = :truncation
    else
      DatabaseCleaner.strategy = :transaction
    end
    DatabaseCleaner.start
  end

  config.after :each do
    DatabaseCleaner.clean
  end
end
