ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"


# load lesli testing tools
require "lesli_testing/loader"


# register engine for testing
LesliTesting.configure(Lesli::Engine)


# initialize coverage
LesliTesting.configure_coverage({ :min_coverage => 10 })


# load test from all installed engines
Dir["#{Rails.root}/engines/**/*_test.rb"].each { |file| require file }
Dir["#{Rails.root}/engines/**/**/*_test.rb"].each { |file| require file }
Dir["#{Rails.root}/gems/**/**/*_test.rb"].each { |file| require file }
Dir["#{Rails.root}/gems/**/*_test.rb"].each { |file| require file }


# configure tests
LesliTesting.configure_engine()


module ActiveSupport
    class TestCase
        # Run tests in parallel with specified workers
        parallelize(workers: :number_of_processors)

        # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
        #fixtures :all

        # Add more helper methods to be used by all tests here...
    end
end
