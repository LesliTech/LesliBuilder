require "test_helper"

class LesliModulesTest < ActiveSupport::TestCase
    OFFICIAL_ENGINES = {
        "Lesli" => :lesli,
        "LesliAdmin" => :lesli_admin,
        "LesliAudit" => :lesli_audit,
        "LesliBabel" => :lesli_babel,
        "LesliBell" => :lesli_bell,
        "LesliCalendar" => :lesli_calendar,
        "LesliDashboard" => :lesli_dashboard,
        "LesliShield" => :lesli_shield,
        "LesliSupport" => :lesli_support
    }.freeze

    OFFICIAL_GEMS = %w[
        LesliAssets
        LesliDate
        LesliSystem
        LesliTesting
        LesliView
        Termline
    ].freeze

    ENGINE_ACCOUNT_ASSOCIATIONS = %i[
        admin
        audit
        bell
        calendar
        dashboard
        shield
        support
    ].freeze

    REQUIRED_TABLES = %w[
        lesli_accounts
        lesli_admin_accounts
        lesli_audit_accounts
        lesli_babel_modules
        lesli_bell_accounts
        lesli_calendar_accounts
        lesli_dashboard_accounts
        lesli_shield_accounts
        lesli_support_accounts
    ].freeze

    test "loads every official engine and mounts its route" do
        routes = Rails.application.routes.named_routes

        OFFICIAL_ENGINES.each do |module_name, route_name|
            engine_class = "#{module_name}::Engine".constantize

            assert engine_class < Rails::Engine, "Expected #{module_name}::Engine to inherit from Rails::Engine"
            assert_includes routes.names, route_name, "Expected the #{route_name} route to be mounted"
        end
    end

    test "loads every official support gem" do
        OFFICIAL_GEMS.each do |module_name|
            assert Object.const_defined?(module_name, false), "Expected #{module_name} to be loaded"
            assert "#{module_name}::VERSION".constantize.present?, "Expected #{module_name}::VERSION to be defined"
        end
    end

    test "loads the database schema required by every official engine" do
        connection = ActiveRecord::Base.connection

        REQUIRED_TABLES.each do |table_name|
            assert connection.data_source_exists?(table_name), "Expected #{table_name} to exist"
        end
    end

    test "provisions every engine account from the core account" do
        account = Lesli::Account.create!(
            name: "Integrated Builder Account",
            email: "builder-integration@example.com",
            status: :active,
            region: :america
        )

        ENGINE_ACCOUNT_ASSOCIATIONS.each do |association_name|
            engine_account = account.public_send(association_name)

            assert engine_account.present?, "Expected #{association_name} account to be provisioned"
            assert_equal account, engine_account.account
        end
    end
end
