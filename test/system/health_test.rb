require "application_system_test_case"

class HealthTest < ApplicationSystemTestCase
    test "serves the Rails health endpoint" do
        visit rails_health_check_path

        assert_equal 200, page.status_code
    end
end
