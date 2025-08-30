ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

if ENV["LESLI_INTEGRATION_TEST"]
    Dir["#{Rails.root}/engines/Lesli/**/*_test.rb"].each { |file| require file }
end

module ActiveSupport
    class TestCase
        # Run tests in parallel with specified workers
        parallelize(workers: :number_of_processors)

        # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
        #fixtures :all

        # Add more helper methods to be used by all tests here...
    end
end
