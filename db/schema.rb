# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 901120110) do
  create_table "lesli_account_activities", force: :cascade do |t|
    t.string "description"
    t.string "field_name"
    t.string "value_from"
    t.string "value_to"
    t.string "category"
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "account_id"
    t.index ["account_id"], name: "index_lesli_account_activities_on_account_id"
  end

  create_table "lesli_account_details", force: :cascade do |t|
    t.string "company_name"
    t.string "company_name_legal"
    t.string "company_tagline"
    t.integer "country"
    t.string "address"
    t.string "region"
    t.string "city"
    t.string "postal_code"
    t.string "website"
    t.string "phone_number_1"
    t.string "phone_number_2"
    t.string "phone_number_3"
    t.string "phone_number_4"
    t.string "public_email"
    t.string "github"
    t.string "twitter"
    t.string "youtube"
    t.string "linkedin"
    t.string "facebook"
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "account_id"
    t.index ["account_id"], name: "index_lesli_account_details_on_account_id"
    t.index ["deleted_at"], name: "index_lesli_account_details_on_deleted_at"
  end

  create_table "lesli_account_logs", force: :cascade do |t|
    t.string "system_module"
    t.string "system_process"
    t.string "description"
    t.string "title"
    t.json "payload"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "lesli_account_id"
    t.index ["lesli_account_id"], name: "index_lesli_account_logs_on_lesli_account_id"
  end

  create_table "lesli_account_settings", force: :cascade do |t|
    t.string "name"
    t.string "value"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "account_id"
    t.index ["account_id"], name: "index_lesli_account_settings_on_account_id"
  end

  create_table "lesli_accounts", force: :cascade do |t|
    t.integer "status", default: 1, null: false
    t.string "email"
    t.string "name"
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "user_id"
    t.index ["deleted_at"], name: "index_lesli_accounts_on_deleted_at"
    t.index ["email"], name: "index_lesli_accounts_on_email", unique: true
    t.index ["user_id"], name: "index_lesli_accounts_on_user_id"
  end

  create_table "lesli_admin_accounts", force: :cascade do |t|
    t.integer "status"
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "account_id"
    t.index ["account_id"], name: "index_lesli_admin_accounts_on_account_id"
    t.index ["deleted_at"], name: "index_lesli_admin_accounts_on_deleted_at"
  end

  create_table "lesli_admin_dashboard_components", force: :cascade do |t|
    t.string "name"
    t.string "component_id"
    t.integer "layout"
    t.integer "index"
    t.json "query_configuration"
    t.json "custom_configuration"
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "dashboard_id"
    t.index ["dashboard_id"], name: "lesli_admin_dashboard_components_dashboards"
  end

  create_table "lesli_admin_dashboards", force: :cascade do |t|
    t.string "name"
    t.boolean "default"
    t.boolean "main"
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "account_id"
    t.integer "user_id"
    t.index ["account_id"], name: "index_lesli_admin_dashboards_on_account_id"
    t.index ["user_id"], name: "index_lesli_admin_dashboards_on_user_id"
  end

  create_table "lesli_audit_account_requests", force: :cascade do |t|
    t.string "request_controller"
    t.string "request_action"
    t.integer "request_count"
    t.date "created_at"
    t.integer "account_id"
    t.index ["account_id"], name: "index_lesli_audit_account_requests_on_account_id"
    t.index ["request_controller", "request_action", "created_at", "account_id"], name: "lesli_audit_account_requests_index", unique: true
  end

  create_table "lesli_audit_accounts", force: :cascade do |t|
    t.integer "status"
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "account_id"
    t.index ["account_id"], name: "index_lesli_audit_accounts_on_account_id"
    t.index ["deleted_at"], name: "index_lesli_audit_accounts_on_deleted_at"
  end

  create_table "lesli_audit_dashboard_components", force: :cascade do |t|
    t.string "name"
    t.string "component_id"
    t.integer "layout"
    t.integer "index"
    t.json "query_configuration"
    t.json "custom_configuration"
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "dashboard_id"
    t.index ["dashboard_id"], name: "lesli_audit_dashboard_components_dashboards"
  end

  create_table "lesli_audit_dashboards", force: :cascade do |t|
    t.string "name"
    t.boolean "default"
    t.boolean "main"
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "account_id"
    t.integer "user_id"
    t.index ["account_id"], name: "index_lesli_audit_dashboards_on_account_id"
    t.index ["user_id"], name: "index_lesli_audit_dashboards_on_user_id"
  end

  create_table "lesli_audit_user_requests", force: :cascade do |t|
    t.string "request_controller"
    t.string "request_action"
    t.integer "request_count"
    t.date "created_at"
    t.integer "user_id"
    t.integer "session_id"
    t.integer "account_id"
    t.index ["account_id"], name: "index_lesli_audit_user_requests_on_account_id"
    t.index ["request_controller", "request_action", "created_at", "user_id", "session_id"], name: "lesli_audit_user_requests_index", unique: true
    t.index ["session_id"], name: "index_lesli_audit_user_requests_on_session_id"
    t.index ["user_id"], name: "index_lesli_audit_user_requests_on_user_id"
  end

  create_table "lesli_babel_buckets", force: :cascade do |t|
    t.string "code"
    t.string "reference_module"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "module_id"
    t.index ["module_id"], name: "index_lesli_babel_buckets_on_module_id"
  end

  create_table "lesli_babel_modules", force: :cascade do |t|
    t.string "code"
    t.string "platform"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lesli_babel_strings", force: :cascade do |t|
    t.string "label"
    t.string "es"
    t.string "en"
    t.string "de"
    t.string "fr"
    t.string "nl"
    t.string "pl"
    t.string "pt"
    t.string "it"
    t.string "tr"
    t.string "ro"
    t.string "bg"
    t.string "uk"
    t.string "sr"
    t.string "hr"
    t.integer "status"
    t.string "context"
    t.datetime "last_update_es", precision: nil
    t.datetime "last_update_en", precision: nil
    t.datetime "last_update_de", precision: nil
    t.datetime "last_update_fr", precision: nil
    t.datetime "last_update_nl", precision: nil
    t.datetime "last_update_pl", precision: nil
    t.datetime "last_update_pt", precision: nil
    t.datetime "last_update_it", precision: nil
    t.datetime "last_update_tr", precision: nil
    t.datetime "last_update_ro", precision: nil
    t.datetime "last_update_bg", precision: nil
    t.datetime "last_update_uk", precision: nil
    t.datetime "last_update_sr", precision: nil
    t.datetime "last_update_hr", precision: nil
    t.datetime "last_update_status", precision: nil
    t.datetime "last_update_context", precision: nil
    t.string "reference_bucket"
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "bucket_id"
    t.index ["bucket_id"], name: "index_lesli_babel_strings_on_bucket_id"
  end

  create_table "lesli_bell_accounts", force: :cascade do |t|
    t.integer "status"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "account_id"
    t.index ["account_id"], name: "index_lesli_bell_accounts_on_account_id"
    t.index ["deleted_at"], name: "index_lesli_bell_accounts_on_deleted_at"
  end

  create_table "lesli_bell_announcements", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.string "category"
    t.string "base_path"
    t.text "message"
    t.boolean "status"
    t.datetime "start_at", precision: nil
    t.datetime "end_at", precision: nil
    t.boolean "can_be_closed", default: true
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "role_id"
    t.integer "account_id"
    t.index ["account_id"], name: "index_lesli_bell_announcements_on_account_id"
    t.index ["deleted_at"], name: "index_lesli_bell_announcements_on_deleted_at"
    t.index ["role_id"], name: "index_lesli_bell_announcements_on_role_id"
    t.index ["url"], name: "index_lesli_bell_announcements_on_url"
    t.index ["user_id"], name: "index_lesli_bell_announcements_on_user_id"
  end

  create_table "lesli_bell_notifications", force: :cascade do |t|
    t.string "subject"
    t.text "body"
    t.string "url"
    t.string "status"
    t.string "category"
    t.string "channel"
    t.string "notification_type"
    t.string "media"
    t.json "payload"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "account_id"
    t.index ["account_id"], name: "index_lesli_bell_notifications_on_account_id"
    t.index ["deleted_at"], name: "index_lesli_bell_notifications_on_deleted_at"
    t.index ["user_id"], name: "index_lesli_bell_notifications_on_user_id"
  end

  create_table "lesli_calendar_accounts", force: :cascade do |t|
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "account_id"
    t.index ["account_id"], name: "index_lesli_calendar_accounts_on_account_id"
    t.index ["deleted_at"], name: "index_lesli_calendar_accounts_on_deleted_at"
  end

  create_table "lesli_calendar_calendars", force: :cascade do |t|
    t.string "name"
    t.string "color", default: "0d52bf"
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "account_id"
    t.index ["account_id"], name: "index_lesli_calendar_calendars_on_account_id"
    t.index ["deleted_at"], name: "index_lesli_calendar_calendars_on_deleted_at"
    t.index ["user_id"], name: "index_lesli_calendar_calendars_on_user_id"
  end

  create_table "lesli_calendar_events", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.date "date"
    t.datetime "start", precision: nil
    t.datetime "end", precision: nil
    t.string "url"
    t.string "location"
    t.string "status"
    t.boolean "public"
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "account_id"
    t.integer "calendar_id"
    t.integer "user_id"
    t.index ["account_id"], name: "index_lesli_calendar_events_on_account_id"
    t.index ["calendar_id"], name: "index_lesli_calendar_events_on_calendar_id"
    t.index ["deleted_at"], name: "index_lesli_calendar_events_on_deleted_at"
    t.index ["user_id"], name: "index_lesli_calendar_events_on_user_id"
  end

  create_table "lesli_dashboard_accounts", force: :cascade do |t|
    t.integer "status"
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "account_id"
    t.index ["account_id"], name: "index_lesli_dashboard_accounts_on_account_id"
    t.index ["deleted_at"], name: "index_lesli_dashboard_accounts_on_deleted_at"
  end

  create_table "lesli_dashboard_dashboard_components", force: :cascade do |t|
    t.string "name"
    t.string "component_id"
    t.integer "layout"
    t.integer "index"
    t.json "query_configuration"
    t.json "custom_configuration"
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "dashboard_id"
    t.index ["dashboard_id"], name: "lesli_dashboard_dashboard_components_dashboards"
  end

  create_table "lesli_dashboard_dashboards", force: :cascade do |t|
    t.string "name"
    t.boolean "default"
    t.boolean "main"
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "account_id"
    t.integer "user_id"
    t.index ["account_id"], name: "index_lesli_dashboard_dashboards_on_account_id"
    t.index ["user_id"], name: "index_lesli_dashboard_dashboards_on_user_id"
  end

  create_table "lesli_descriptor_activities", force: :cascade do |t|
    t.string "description"
    t.string "field_name"
    t.string "value_from"
    t.string "value_to"
    t.string "category"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "descriptor_id"
    t.index ["descriptor_id"], name: "index_lesli_descriptor_activities_on_descriptor_id"
  end

  create_table "lesli_descriptor_privileges", force: :cascade do |t|
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "descriptor_id"
    t.integer "action_id"
    t.index ["action_id"], name: "descriptor_privileges_controller_actions"
    t.index ["deleted_at"], name: "index_lesli_descriptor_privileges_on_deleted_at"
    t.index ["descriptor_id"], name: "index_lesli_descriptor_privileges_on_descriptor_id"
  end

  create_table "lesli_descriptors", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "account_id"
    t.index ["account_id"], name: "index_lesli_descriptors_on_account_id"
    t.index ["deleted_at"], name: "index_lesli_descriptors_on_deleted_at"
  end

  create_table "lesli_role_powers", force: :cascade do |t|
    t.boolean "plist"
    t.boolean "pindex"
    t.boolean "pshow"
    t.boolean "pcreate"
    t.boolean "pupdate"
    t.boolean "pdestroy"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "role_id"
    t.integer "descriptor_id"
    t.index ["deleted_at"], name: "index_lesli_role_powers_on_deleted_at"
    t.index ["descriptor_id"], name: "index_lesli_role_powers_on_descriptor_id"
    t.index ["role_id"], name: "index_lesli_role_powers_on_role_id"
    t.index ["user_id"], name: "index_lesli_role_powers_on_user_id"
  end

  create_table "lesli_role_privileges", force: :cascade do |t|
    t.string "controller"
    t.string "action"
    t.boolean "active"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role_id"
    t.index ["controller", "action", "role_id"], name: "role_privileges_index", unique: true
    t.index ["deleted_at"], name: "index_lesli_role_privileges_on_deleted_at"
    t.index ["role_id"], name: "index_lesli_role_privileges_on_role_id"
  end

  create_table "lesli_roles", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.string "description"
    t.boolean "active"
    t.string "path_default"
    t.boolean "path_limited"
    t.boolean "isolated", default: false
    t.integer "object_level_permission", default: 10
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "account_id"
    t.index ["account_id"], name: "index_lesli_roles_on_account_id"
    t.index ["deleted_at"], name: "index_lesli_roles_on_deleted_at"
  end

  create_table "lesli_security_accounts", force: :cascade do |t|
    t.integer "status"
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "account_id"
    t.index ["account_id"], name: "index_lesli_security_accounts_on_account_id"
    t.index ["deleted_at"], name: "index_lesli_security_accounts_on_deleted_at"
  end

  create_table "lesli_security_dashboard_components", force: :cascade do |t|
    t.string "name"
    t.string "component_id"
    t.integer "layout"
    t.integer "index"
    t.json "query_configuration"
    t.json "custom_configuration"
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "dashboard_id"
    t.index ["dashboard_id"], name: "lesli_security_dashboard_components_index"
  end

  create_table "lesli_security_dashboards", force: :cascade do |t|
    t.string "name"
    t.boolean "default"
    t.boolean "main"
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "account_id"
    t.integer "user_id"
    t.index ["account_id"], name: "index_lesli_security_dashboards_on_account_id"
    t.index ["user_id"], name: "index_lesli_security_dashboards_on_user_id"
  end

  create_table "lesli_shield_accounts", force: :cascade do |t|
    t.integer "status"
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "account_id"
    t.index ["account_id"], name: "index_lesli_shield_accounts_on_account_id"
    t.index ["deleted_at"], name: "index_lesli_shield_accounts_on_deleted_at"
  end

  create_table "lesli_shield_dashboard_components", force: :cascade do |t|
    t.string "name"
    t.string "component_id"
    t.integer "layout"
    t.integer "index"
    t.json "query_configuration"
    t.json "custom_configuration"
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "dashboard_id"
    t.index ["dashboard_id"], name: "lesli_shield_dashboard_components_index"
  end

  create_table "lesli_shield_dashboards", force: :cascade do |t|
    t.string "name"
    t.boolean "default"
    t.boolean "main"
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "account_id"
    t.integer "user_id"
    t.index ["account_id"], name: "index_lesli_shield_dashboards_on_account_id"
    t.index ["user_id"], name: "index_lesli_shield_dashboards_on_user_id"
  end

  create_table "lesli_support_account_settings", force: :cascade do |t|
    t.string "key"
    t.string "value"
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "account_id"
    t.integer "user_id"
    t.index ["account_id"], name: "index_lesli_support_account_settings_on_account_id"
    t.index ["deleted_at"], name: "index_lesli_support_account_settings_on_deleted_at"
    t.index ["user_id"], name: "index_lesli_support_account_settings_on_user_id"
  end

  create_table "lesli_support_accounts", force: :cascade do |t|
    t.integer "status"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "account_id"
    t.index ["account_id"], name: "index_lesli_support_accounts_on_account_id"
    t.index ["deleted_at"], name: "index_lesli_support_accounts_on_deleted_at"
  end

  create_table "lesli_support_catalog_categories", force: :cascade do |t|
    t.string "name"
    t.string "ancestry"
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "account_id"
    t.index ["account_id"], name: "index_lesli_support_catalog_categories_on_account_id"
    t.index ["ancestry"], name: "index_lesli_support_catalog_categories_on_ancestry"
    t.index ["deleted_at"], name: "index_lesli_support_catalog_categories_on_deleted_at"
  end

  create_table "lesli_support_catalog_priorities", force: :cascade do |t|
    t.string "name"
    t.integer "weight"
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "account_id"
    t.index ["account_id"], name: "index_lesli_support_catalog_priorities_on_account_id"
    t.index ["deleted_at"], name: "index_lesli_support_catalog_priorities_on_deleted_at"
  end

  create_table "lesli_support_catalog_types", force: :cascade do |t|
    t.string "name"
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "account_id"
    t.index ["account_id"], name: "index_lesli_support_catalog_types_on_account_id"
    t.index ["deleted_at"], name: "index_lesli_support_catalog_types_on_deleted_at"
  end

  create_table "lesli_support_catalog_workspaces", force: :cascade do |t|
    t.string "name"
    t.boolean "default", default: false
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "account_id"
    t.index ["account_id"], name: "index_lesli_support_catalog_workspaces_on_account_id"
    t.index ["deleted_at"], name: "index_lesli_support_catalog_workspaces_on_deleted_at"
  end

  create_table "lesli_support_dashboard_components", force: :cascade do |t|
    t.string "name"
    t.string "component_id"
    t.integer "layout"
    t.integer "index"
    t.json "query_configuration"
    t.json "custom_configuration"
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "dashboard_id"
    t.index ["dashboard_id"], name: "help_dashboard_components_dashboards"
  end

  create_table "lesli_support_dashboards", force: :cascade do |t|
    t.string "name"
    t.boolean "default"
    t.boolean "main"
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "account_id"
    t.integer "user_id"
    t.integer "role_id"
    t.index ["account_id"], name: "index_lesli_support_dashboards_on_account_id"
    t.index ["role_id"], name: "index_lesli_support_dashboards_on_role_id"
    t.index ["user_id"], name: "index_lesli_support_dashboards_on_user_id"
  end

  create_table "lesli_support_slas", force: :cascade do |t|
    t.string "name"
    t.integer "expected_response_time"
    t.integer "expected_resolution_time"
    t.float "price_per_hour"
    t.text "body"
    t.text "provider_repercussions"
    t.text "client_repercussions"
    t.text "exceptions"
    t.boolean "default", default: false
    t.integer "user_main_id"
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "accounts_id"
    t.integer "users_id"
    t.index ["accounts_id"], name: "index_lesli_support_slas_on_accounts_id"
    t.index ["deleted_at"], name: "index_lesli_support_slas_on_deleted_at"
    t.index ["users_id"], name: "index_lesli_support_slas_on_users_id"
  end

  create_table "lesli_support_ticket_discussions", force: :cascade do |t|
    t.text "content"
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "discussion_id"
    t.integer "ticket_id"
    t.integer "user_id"
    t.index ["discussion_id"], name: "index_lesli_support_ticket_discussions_on_discussion_id"
    t.index ["ticket_id"], name: "index_lesli_support_ticket_discussions_on_ticket_id"
    t.index ["user_id"], name: "index_lesli_support_ticket_discussions_on_user_id"
  end

  create_table "lesli_support_tickets", force: :cascade do |t|
    t.string "subject"
    t.text "description"
    t.string "tags"
    t.decimal "hours_worked"
    t.string "reference_url"
    t.datetime "deadline", precision: nil
    t.datetime "started_at", precision: nil
    t.datetime "completed_at", precision: nil
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "catalog_workspace_id"
    t.integer "catalog_type_id"
    t.integer "catalog_category_id"
    t.integer "catalog_priority_id"
    t.integer "slas_id"
    t.integer "user_id"
    t.integer "creator_id"
    t.integer "account_id"
    t.index ["account_id"], name: "index_lesli_support_tickets_on_account_id"
    t.index ["catalog_category_id"], name: "support_tickets_catalog_categories"
    t.index ["catalog_priority_id"], name: "support_tickets_catalog_priorities"
    t.index ["catalog_type_id"], name: "support_tickets_catalog_types"
    t.index ["catalog_workspace_id"], name: "support_tickets_catalog_workspaces"
    t.index ["creator_id"], name: "index_lesli_support_tickets_on_creator_id"
    t.index ["deleted_at"], name: "index_lesli_support_tickets_on_deleted_at"
    t.index ["slas_id"], name: "index_lesli_support_tickets_on_slas_id"
    t.index ["user_id"], name: "index_lesli_support_tickets_on_user_id"
  end

  create_table "lesli_system_controller_actions", force: :cascade do |t|
    t.string "name"
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "system_controller_id"
    t.index ["deleted_at"], name: "index_lesli_system_controller_actions_on_deleted_at"
    t.index ["system_controller_id"], name: "index_lesli_system_controller_actions_on_system_controller_id"
  end

  create_table "lesli_system_controllers", force: :cascade do |t|
    t.string "name"
    t.string "route"
    t.string "engine"
    t.string "reference"
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_lesli_system_controllers_on_deleted_at"
  end

  create_table "lesli_user_details", force: :cascade do |t|
    t.string "title"
    t.string "address"
    t.integer "work_city"
    t.integer "work_region"
    t.integer "work_address"
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["deleted_at"], name: "index_lesli_user_details_on_deleted_at"
    t.index ["user_id"], name: "index_lesli_user_details_on_user_id"
  end

  create_table "lesli_user_logs", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "session_id"
    t.index ["session_id"], name: "index_lesli_user_logs_on_session_id"
    t.index ["user_id"], name: "index_lesli_user_logs_on_user_id"
  end

  create_table "lesli_user_powers", force: :cascade do |t|
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "role_id"
    t.index ["deleted_at"], name: "index_lesli_user_powers_on_deleted_at"
    t.index ["role_id"], name: "index_lesli_user_powers_on_role_id"
    t.index ["user_id"], name: "index_lesli_user_powers_on_user_id"
  end

  create_table "lesli_user_sessions", force: :cascade do |t|
    t.string "remote"
    t.string "agent_platform"
    t.string "agent_os"
    t.string "agent_browser"
    t.string "agent_version"
    t.string "session_token"
    t.string "session_source"
    t.integer "usage_count"
    t.datetime "last_used_at", precision: nil
    t.datetime "expiration_at", precision: nil
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["deleted_at"], name: "index_lesli_user_sessions_on_deleted_at"
    t.index ["expiration_at"], name: "index_lesli_user_sessions_on_expiration_at"
    t.index ["user_id"], name: "index_lesli_user_sessions_on_user_id"
  end

  create_table "lesli_user_settings", force: :cascade do |t|
    t.string "name"
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id", "name"], name: "index_lesli_user_settings_on_user_id_and_name", unique: true
    t.index ["user_id"], name: "index_lesli_user_settings_on_user_id"
  end

  create_table "lesli_users", force: :cascade do |t|
    t.boolean "active", default: true, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "alias"
    t.string "salutation"
    t.string "first_name"
    t.string "last_name"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: nil
    t.datetime "password_expiration_at", precision: nil
    t.datetime "locked_until", precision: nil
    t.datetime "remember_created_at", precision: nil
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at", precision: nil
    t.datetime "last_sign_in_at", precision: nil
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "unconfirmed_email"
    t.string "confirmation_token"
    t.datetime "confirmation_sent_at", precision: nil
    t.datetime "confirmed_at", precision: nil
    t.string "telephone"
    t.string "telephone_confirmation_token"
    t.datetime "telephone_confirmation_sent_at", precision: nil
    t.datetime "telephone_confirmed_at", precision: nil
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at", precision: nil
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "account_id"
    t.index ["account_id"], name: "index_lesli_users_on_account_id"
    t.index ["confirmation_token"], name: "index_lesli_users_on_confirmation_token", unique: true
    t.index ["deleted_at"], name: "index_lesli_users_on_deleted_at"
    t.index ["email"], name: "index_lesli_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_lesli_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_lesli_users_on_unlock_token", unique: true
  end

  add_foreign_key "lesli_account_activities", "lesli_accounts", column: "account_id"
  add_foreign_key "lesli_account_details", "lesli_accounts", column: "account_id"
  add_foreign_key "lesli_account_logs", "lesli_accounts"
  add_foreign_key "lesli_account_settings", "lesli_accounts", column: "account_id"
  add_foreign_key "lesli_accounts", "lesli_users", column: "user_id"
  add_foreign_key "lesli_admin_accounts", "lesli_accounts", column: "account_id"
  add_foreign_key "lesli_admin_dashboard_components", "lesli_admin_dashboards", column: "dashboard_id"
  add_foreign_key "lesli_admin_dashboards", "lesli_admin_accounts", column: "account_id"
  add_foreign_key "lesli_admin_dashboards", "lesli_users", column: "user_id"
  add_foreign_key "lesli_audit_account_requests", "lesli_audit_accounts", column: "account_id"
  add_foreign_key "lesli_audit_accounts", "lesli_accounts", column: "account_id"
  add_foreign_key "lesli_audit_dashboard_components", "lesli_audit_dashboards", column: "dashboard_id"
  add_foreign_key "lesli_audit_dashboards", "lesli_audit_accounts", column: "account_id"
  add_foreign_key "lesli_audit_dashboards", "lesli_users", column: "user_id"
  add_foreign_key "lesli_audit_user_requests", "lesli_audit_accounts", column: "account_id"
  add_foreign_key "lesli_audit_user_requests", "lesli_user_sessions", column: "session_id"
  add_foreign_key "lesli_audit_user_requests", "lesli_users", column: "user_id"
  add_foreign_key "lesli_babel_buckets", "lesli_babel_modules", column: "module_id"
  add_foreign_key "lesli_babel_strings", "lesli_babel_buckets", column: "bucket_id"
  add_foreign_key "lesli_bell_accounts", "lesli_accounts", column: "account_id"
  add_foreign_key "lesli_bell_announcements", "lesli_accounts", column: "account_id"
  add_foreign_key "lesli_bell_announcements", "lesli_roles", column: "role_id"
  add_foreign_key "lesli_bell_announcements", "lesli_users", column: "user_id"
  add_foreign_key "lesli_bell_notifications", "lesli_accounts", column: "account_id"
  add_foreign_key "lesli_bell_notifications", "lesli_users", column: "user_id"
  add_foreign_key "lesli_calendar_accounts", "lesli_accounts", column: "account_id"
  add_foreign_key "lesli_calendar_calendars", "lesli_calendar_accounts", column: "account_id"
  add_foreign_key "lesli_calendar_calendars", "lesli_users", column: "user_id"
  add_foreign_key "lesli_calendar_events", "lesli_accounts", column: "account_id"
  add_foreign_key "lesli_calendar_events", "lesli_calendar_calendars", column: "calendar_id"
  add_foreign_key "lesli_calendar_events", "lesli_users", column: "user_id"
  add_foreign_key "lesli_dashboard_accounts", "lesli_accounts", column: "account_id"
  add_foreign_key "lesli_dashboard_dashboard_components", "lesli_dashboard_dashboards", column: "dashboard_id"
  add_foreign_key "lesli_dashboard_dashboards", "lesli_dashboard_accounts", column: "account_id"
  add_foreign_key "lesli_dashboard_dashboards", "lesli_users", column: "user_id"
  add_foreign_key "lesli_descriptor_activities", "lesli_descriptors", column: "descriptor_id"
  add_foreign_key "lesli_descriptor_privileges", "lesli_descriptors", column: "descriptor_id"
  add_foreign_key "lesli_descriptor_privileges", "lesli_system_controller_actions", column: "action_id"
  add_foreign_key "lesli_descriptors", "lesli_accounts", column: "account_id"
  add_foreign_key "lesli_role_powers", "lesli_descriptors", column: "descriptor_id"
  add_foreign_key "lesli_role_powers", "lesli_roles", column: "role_id"
  add_foreign_key "lesli_role_powers", "lesli_users", column: "user_id"
  add_foreign_key "lesli_role_privileges", "lesli_roles", column: "role_id"
  add_foreign_key "lesli_roles", "lesli_accounts", column: "account_id"
  add_foreign_key "lesli_security_accounts", "lesli_accounts", column: "account_id"
  add_foreign_key "lesli_security_dashboard_components", "lesli_security_dashboards", column: "dashboard_id"
  add_foreign_key "lesli_security_dashboards", "lesli_security_accounts", column: "account_id"
  add_foreign_key "lesli_security_dashboards", "lesli_users", column: "user_id"
  add_foreign_key "lesli_shield_accounts", "lesli_accounts", column: "account_id"
  add_foreign_key "lesli_shield_dashboard_components", "lesli_shield_dashboards", column: "dashboard_id"
  add_foreign_key "lesli_shield_dashboards", "lesli_shield_accounts", column: "account_id"
  add_foreign_key "lesli_shield_dashboards", "lesli_users", column: "user_id"
  add_foreign_key "lesli_support_account_settings", "lesli_support_accounts", column: "account_id"
  add_foreign_key "lesli_support_account_settings", "lesli_users", column: "user_id"
  add_foreign_key "lesli_support_accounts", "lesli_accounts", column: "account_id"
  add_foreign_key "lesli_support_catalog_categories", "lesli_support_accounts", column: "account_id"
  add_foreign_key "lesli_support_catalog_priorities", "lesli_support_accounts", column: "account_id"
  add_foreign_key "lesli_support_catalog_types", "lesli_support_accounts", column: "account_id"
  add_foreign_key "lesli_support_catalog_workspaces", "lesli_support_accounts", column: "account_id"
  add_foreign_key "lesli_support_dashboard_components", "lesli_support_dashboards", column: "dashboard_id"
  add_foreign_key "lesli_support_dashboards", "lesli_roles", column: "role_id"
  add_foreign_key "lesli_support_dashboards", "lesli_support_accounts", column: "account_id"
  add_foreign_key "lesli_support_dashboards", "lesli_users", column: "user_id"
  add_foreign_key "lesli_support_slas", "lesli_support_accounts", column: "accounts_id"
  add_foreign_key "lesli_support_slas", "lesli_users", column: "users_id"
  add_foreign_key "lesli_support_ticket_discussions", "lesli_support_ticket_discussions", column: "discussion_id"
  add_foreign_key "lesli_support_ticket_discussions", "lesli_support_tickets", column: "ticket_id"
  add_foreign_key "lesli_support_ticket_discussions", "lesli_users", column: "user_id"
  add_foreign_key "lesli_support_tickets", "lesli_support_accounts", column: "account_id"
  add_foreign_key "lesli_support_tickets", "lesli_support_catalog_categories", column: "catalog_category_id"
  add_foreign_key "lesli_support_tickets", "lesli_support_catalog_priorities", column: "catalog_priority_id"
  add_foreign_key "lesli_support_tickets", "lesli_support_catalog_types", column: "catalog_type_id"
  add_foreign_key "lesli_support_tickets", "lesli_support_catalog_workspaces", column: "catalog_workspace_id"
  add_foreign_key "lesli_support_tickets", "lesli_support_slas", column: "slas_id"
  add_foreign_key "lesli_support_tickets", "lesli_users", column: "creator_id"
  add_foreign_key "lesli_support_tickets", "lesli_users", column: "user_id"
  add_foreign_key "lesli_system_controller_actions", "lesli_system_controllers", column: "system_controller_id"
  add_foreign_key "lesli_user_details", "lesli_users", column: "user_id"
  add_foreign_key "lesli_user_logs", "lesli_user_sessions", column: "session_id"
  add_foreign_key "lesli_user_logs", "lesli_users", column: "user_id"
  add_foreign_key "lesli_user_powers", "lesli_roles", column: "role_id"
  add_foreign_key "lesli_user_powers", "lesli_users", column: "user_id"
  add_foreign_key "lesli_user_sessions", "lesli_users", column: "user_id"
  add_foreign_key "lesli_user_settings", "lesli_users", column: "user_id"
  add_foreign_key "lesli_users", "lesli_accounts", column: "account_id"
end
