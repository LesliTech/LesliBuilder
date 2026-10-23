require "application_system_test_case"

class HealthTest < ApplicationSystemTestCase
    test "serves the Rails health endpoint" do
        visit rails_health_check_path

        assert_equal 200, page.status_code
    end

    test "renders the Lesli welcome page when the host has no root route" do
        visit welcome_path

        assert_equal 200, page.status_code
        assert_selector "h1#welcome-title", text: "Build better business software with Rails."
        assert_text "Your Lesli application is ready."
        assert_link "Log in", href: "/login"
    end
end
