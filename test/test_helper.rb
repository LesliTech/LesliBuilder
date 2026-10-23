ENV["RAILS_ENV"] ||= "test"

# Load LesliTesting before the Rails application so coverage can start before
# CI eager-loads the application and every mounted engine.
require "lesli_testing"

require_relative "../config/environment"
require "rails/test_help"


# register engine for testing
LesliTesting.app("LesliBuilder", {
    :coverage_min_coverage => 0.5
})

module ActiveSupport
    class TestCase
        # The Builder verifies how all modules work together in one host process.
        # Package-level unit tests remain isolated in each engine or gem suite.
        parallelize(workers: ENV.fetch("PARALLEL_WORKERS", 1).to_i)

        # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
        #fixtures :all

        # Add more helper methods to be used by all tests here...
    end
end
