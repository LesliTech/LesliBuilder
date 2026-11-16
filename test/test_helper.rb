ENV["RAILS_ENV"] ||= "test"

# Load LesliTesting before the Rails application so coverage can start before
# CI eager-loads the application and every mounted engine.
require "lesli_testing"

require_relative "../config/environment"
require "rails/test_help"


LesliTesting.app("LesliBuilder", coverage_min_coverage: 0.5)

module ActiveSupport
    class TestCase
        # Keep host checks sequential by default.
        parallelize(workers: ENV.fetch("PARALLEL_WORKERS", 1).to_i)
    end
end
