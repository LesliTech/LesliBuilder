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

ActiveRecord::Schema[8.1].define(version: 901120110) do
  create_table "lesli_account_currencies", force: :cascade do |t|
    t.integer "account_id"
    t.string "country_alpha_3"
    t.datetime "created_at", null: false
    t.datetime "deleted_at", precision: nil
    t.string "name"
    t.string "symbol"
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["account_id"], name: "index_lesli_account_currencies_on_account_id"
    t.index ["deleted_at"], name: "index_lesli_account_currencies_on_deleted_at"
    t.index ["user_id"], name: "index_lesli_account_currencies_on_user_id"
  end

  create_table "lesli_account_details", force: :cascade do |t|
    t.integer "account_id"
    t.string "address"
    t.string "city"
    t.string "company_name"
    t.string "company_name_legal"
    t.string "company_tagline"
    t.integer "country"
    t.datetime "created_at", null: false
    t.datetime "deleted_at", precision: nil
    t.string "facebook"
    t.string "github"
    t.string "linkedin"
    t.string "phone_number_1"
    t.string "phone_number_2"
    t.string "phone_number_3"
    t.string "phone_number_4"
    t.string "postal_code"
    t.string "public_email"
    t.string "region"
    t.string "twitter"
    t.datetime "updated_at", null: false
    t.string "website"
    t.string "youtube"
    t.index ["account_id"], name: "index_lesli_account_details_on_account_id"
    t.index ["deleted_at"], name: "index_lesli_account_details_on_deleted_at"
  end

  create_table "lesli_account_locations", force: :cascade do |t|
    t.integer "account_id"
    t.string "calling_code"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "deleted_at", precision: nil
    t.string "latitude"
    t.string "level"
    t.string "longitude"
    t.string "name"
    t.string "native_level"
    t.integer "parent_id"
    t.string "postal_code"
    t.string "short_name"
    t.datetime "updated_at", null: false
    t.index ["account_id", "name", "level", "parent_id"], name: "location_uniqueness_index", unique: true
    t.index ["account_id"], name: "index_lesli_account_locations_on_account_id"
    t.index ["deleted_at"], name: "index_lesli_account_locations_on_deleted_at"
    t.index ["parent_id"], name: "index_lesli_account_locations_on_parent_id"
  end

  create_table "lesli_accounts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "deleted_at"
    t.string "email", null: false
    t.string "name"
    t.string "region", default: "america"
    t.string "status", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["deleted_at"], name: "index_lesli_accounts_on_deleted_at"
    t.index ["email"], name: "index_lesli_accounts_on_email", unique: true
    t.index ["user_id"], name: "index_lesli_accounts_on_user_id"
  end

  create_table "lesli_admin_accounts", force: :cascade do |t|
    t.integer "account_id", null: false
    t.datetime "created_at", null: false
    t.datetime "deleted_at", precision: nil
    t.datetime "enabled_at", precision: nil
    t.string "name"
    t.integer "status", default: 0, null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_lesli_admin_accounts_on_account_id"
    t.index ["deleted_at"], name: "index_lesli_admin_accounts_on_deleted_at"
  end

  create_table "lesli_admin_dashboards", force: :cascade do |t|
    t.integer "account_id", null: false
    t.json "components"
    t.datetime "created_at", null: false
    t.boolean "default"
    t.datetime "deleted_at", precision: nil
    t.string "name"
    t.integer "role_id"
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["account_id"], name: "index_lesli_admin_dashboards_on_account_id"
    t.index ["deleted_at"], name: "index_lesli_admin_dashboards_on_deleted_at"
    t.index ["role_id"], name: "index_lesli_admin_dashboards_on_role_id"
    t.index ["user_id"], name: "index_lesli_admin_dashboards_on_user_id"
  end

  create_table "lesli_audit_account_devices", force: :cascade do |t|
    t.integer "account_id"
    t.string "agent_browser"
    t.integer "agent_count"
    t.string "agent_platform"
    t.date "created_at"
    t.index ["account_id"], name: "index_lesli_audit_account_devices_on_account_id"
    t.index ["agent_platform", "agent_browser", "created_at", "account_id"], name: "lesli_audit_devices_index", unique: true
  end

  create_table "lesli_audit_account_logs", force: :cascade do |t|
    t.integer "account_id"
    t.string "action"
    t.datetime "created_at", null: false
    t.string "description"
    t.string "engine"
    t.string "operation"
    t.string "session_id"
    t.bigint "subject_id"
    t.string "subject_type"
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["account_id"], name: "index_lesli_audit_account_logs_on_account_id"
    t.index ["user_id"], name: "index_lesli_audit_account_logs_on_user_id"
  end

  create_table "lesli_audit_account_requests", force: :cascade do |t|
    t.integer "account_id"
    t.date "created_at"
    t.string "request_action"
    t.string "request_controller"
    t.integer "request_count"
    t.index ["account_id"], name: "index_lesli_audit_account_requests_on_account_id"
    t.index ["request_controller", "request_action", "created_at", "account_id"], name: "lesli_audit_account_requests_index", unique: true
  end

  create_table "lesli_audit_accounts", force: :cascade do |t|
    t.integer "account_id", null: false
    t.datetime "created_at", null: false
    t.datetime "deleted_at", precision: nil
    t.datetime "enabled_at", precision: nil
    t.string "name"
    t.integer "status", default: 0, null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_lesli_audit_accounts_on_account_id"
    t.index ["deleted_at"], name: "index_lesli_audit_accounts_on_deleted_at"
  end

  create_table "lesli_audit_dashboards", force: :cascade do |t|
    t.integer "account_id", null: false
    t.json "components"
    t.datetime "created_at", null: false
    t.boolean "default"
    t.datetime "deleted_at", precision: nil
    t.string "name"
    t.integer "role_id"
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["account_id"], name: "index_lesli_audit_dashboards_on_account_id"
    t.index ["deleted_at"], name: "index_lesli_audit_dashboards_on_deleted_at"
    t.index ["role_id"], name: "index_lesli_audit_dashboards_on_role_id"
    t.index ["user_id"], name: "index_lesli_audit_dashboards_on_user_id"
  end

  create_table "lesli_audit_user_logs", force: :cascade do |t|
    t.integer "account_id"
    t.string "action"
    t.datetime "created_at", null: false
    t.string "description"
    t.string "engine"
    t.string "operation"
    t.string "session_id"
    t.bigint "subject_id"
    t.string "subject_type"
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["account_id"], name: "index_lesli_audit_user_logs_on_account_id"
    t.index ["user_id"], name: "index_lesli_audit_user_logs_on_user_id"
  end

  create_table "lesli_audit_user_requests", force: :cascade do |t|
    t.integer "account_id"
    t.datetime "created_at", null: false
    t.date "date"
    t.string "request_action"
    t.string "request_controller"
    t.integer "request_count"
    t.integer "session_id"
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["account_id"], name: "index_lesli_audit_user_requests_on_account_id"
    t.index ["date"], name: "index_lesli_audit_user_requests_on_date"
    t.index ["request_controller", "request_action", "date", "user_id", "session_id"], name: "lesli_audit_user_requests_index", unique: true
    t.index ["session_id"], name: "index_lesli_audit_user_requests_on_session_id"
    t.index ["user_id"], name: "index_lesli_audit_user_requests_on_user_id"
  end

  create_table "lesli_babel_buckets", force: :cascade do |t|
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "deleted_at"
    t.integer "module_id"
    t.string "reference_module"
    t.datetime "updated_at", null: false
    t.index ["module_id"], name: "index_lesli_babel_buckets_on_module_id"
  end

  create_table "lesli_babel_labels", force: :cascade do |t|
    t.string "bg"
    t.integer "bucket_id"
    t.string "context"
    t.datetime "created_at", null: false
    t.string "de"
    t.datetime "deleted_at"
    t.string "en"
    t.string "es"
    t.string "fr"
    t.string "hr"
    t.string "it"
    t.datetime "last_update_bg"
    t.datetime "last_update_context"
    t.datetime "last_update_de"
    t.datetime "last_update_en"
    t.datetime "last_update_es"
    t.datetime "last_update_fr"
    t.datetime "last_update_hr"
    t.datetime "last_update_it"
    t.datetime "last_update_nl"
    t.datetime "last_update_pl"
    t.datetime "last_update_pt"
    t.datetime "last_update_ro"
    t.datetime "last_update_sr"
    t.datetime "last_update_status"
    t.datetime "last_update_tr"
    t.datetime "last_update_uk"
    t.string "nl"
    t.string "pl"
    t.string "pt"
    t.string "reference_bucket"
    t.string "ro"
    t.string "sr"
    t.string "status"
    t.string "text"
    t.string "tr"
    t.string "uk"
    t.datetime "updated_at", null: false
    t.index ["bucket_id"], name: "index_lesli_babel_labels_on_bucket_id"
  end

  create_table "lesli_babel_modules", force: :cascade do |t|
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "deleted_at"
    t.string "platform"
    t.datetime "updated_at", null: false
  end

  create_table "lesli_bell_accounts", force: :cascade do |t|
    t.integer "account_id", null: false
    t.datetime "created_at", null: false
    t.datetime "deleted_at"
    t.datetime "enabled_at"
    t.string "name"
    t.integer "status", default: 0, null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_lesli_bell_accounts_on_account_id"
    t.index ["deleted_at"], name: "index_lesli_bell_accounts_on_deleted_at"
  end

  create_table "lesli_bell_announcement_users", force: :cascade do |t|
    t.integer "announcement_id"
    t.datetime "created_at", null: false
    t.datetime "deleted_at"
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["announcement_id"], name: "lesli_bell_announcements_users"
    t.index ["deleted_at"], name: "index_lesli_bell_announcement_users_on_deleted_at"
    t.index ["user_id"], name: "index_lesli_bell_announcement_users_on_user_id"
  end

  create_table "lesli_bell_announcements", force: :cascade do |t|
    t.integer "account_id"
    t.boolean "can_be_closed", default: true
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "deleted_at", precision: nil
    t.datetime "end_at", precision: nil
    t.text "message"
    t.string "name"
    t.string "path"
    t.integer "role_id"
    t.datetime "start_at", precision: nil
    t.boolean "status"
    t.datetime "updated_at", null: false
    t.string "url"
    t.integer "user_id"
    t.index ["account_id"], name: "index_lesli_bell_announcements_on_account_id"
    t.index ["deleted_at"], name: "index_lesli_bell_announcements_on_deleted_at"
    t.index ["role_id"], name: "index_lesli_bell_announcements_on_role_id"
    t.index ["user_id"], name: "index_lesli_bell_announcements_on_user_id"
  end

  create_table "lesli_bell_dashboards", force: :cascade do |t|
    t.integer "account_id", null: false
    t.json "components"
    t.datetime "created_at", null: false
    t.boolean "default"
    t.datetime "deleted_at", precision: nil
    t.string "name"
    t.integer "role_id"
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["account_id"], name: "index_lesli_bell_dashboards_on_account_id"
    t.index ["deleted_at"], name: "index_lesli_bell_dashboards_on_deleted_at"
    t.index ["role_id"], name: "index_lesli_bell_dashboards_on_role_id"
    t.index ["user_id"], name: "index_lesli_bell_dashboards_on_user_id"
  end

  create_table "lesli_bell_notifications", force: :cascade do |t|
    t.integer "account_id"
    t.text "body"
    t.string "category"
    t.string "channel"
    t.datetime "created_at", null: false
    t.datetime "deleted_at"
    t.json "payload"
    t.string "status"
    t.string "subject"
    t.datetime "updated_at", null: false
    t.string "url"
    t.integer "user_id"
    t.index ["account_id"], name: "index_lesli_bell_notifications_on_account_id"
    t.index ["deleted_at"], name: "index_lesli_bell_notifications_on_deleted_at"
    t.index ["user_id"], name: "index_lesli_bell_notifications_on_user_id"
  end

  create_table "lesli_calendar_accounts", force: :cascade do |t|
    t.integer "account_id", null: false
    t.datetime "created_at", null: false
    t.datetime "deleted_at", precision: nil
    t.datetime "enabled_at", precision: nil
    t.string "name"
    t.integer "status", default: 0, null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_lesli_calendar_accounts_on_account_id"
    t.index ["deleted_at"], name: "index_lesli_calendar_accounts_on_deleted_at"
  end

  create_table "lesli_calendar_calendars", force: :cascade do |t|
    t.integer "account_id"
    t.string "color", default: "0d52bf"
    t.datetime "created_at", null: false
    t.datetime "deleted_at", precision: nil
    t.string "name"
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["account_id"], name: "index_lesli_calendar_calendars_on_account_id"
    t.index ["deleted_at"], name: "index_lesli_calendar_calendars_on_deleted_at"
    t.index ["user_id"], name: "index_lesli_calendar_calendars_on_user_id"
  end

  create_table "lesli_calendar_event_attendants", force: :cascade do |t|
    t.datetime "confirmed_at"
    t.datetime "created_at", null: false
    t.datetime "deleted_at"
    t.integer "event_id"
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["confirmed_at"], name: "index_lesli_calendar_event_attendants_on_confirmed_at"
    t.index ["deleted_at"], name: "index_lesli_calendar_event_attendants_on_deleted_at"
    t.index ["event_id"], name: "index_lesli_calendar_event_attendants_on_event_id"
    t.index ["user_id"], name: "index_lesli_calendar_event_attendants_on_user_id"
  end

  create_table "lesli_calendar_events", force: :cascade do |t|
    t.integer "account_id"
    t.integer "calendar_id"
    t.datetime "created_at", null: false
    t.datetime "deleted_at", precision: nil
    t.string "description"
    t.datetime "end_at", precision: nil
    t.string "location"
    t.boolean "public"
    t.datetime "start_at", precision: nil
    t.string "status"
    t.string "title"
    t.datetime "updated_at", null: false
    t.string "url"
    t.integer "user_id"
    t.index ["account_id"], name: "index_lesli_calendar_events_on_account_id"
    t.index ["calendar_id"], name: "index_lesli_calendar_events_on_calendar_id"
    t.index ["deleted_at"], name: "index_lesli_calendar_events_on_deleted_at"
    t.index ["end_at"], name: "index_lesli_calendar_events_on_end_at"
    t.index ["public"], name: "index_lesli_calendar_events_on_public"
    t.index ["start_at"], name: "index_lesli_calendar_events_on_start_at"
    t.index ["status"], name: "index_lesli_calendar_events_on_status"
    t.index ["user_id"], name: "index_lesli_calendar_events_on_user_id"
  end

  create_table "lesli_dashboard_accounts", force: :cascade do |t|
    t.integer "account_id", null: false
    t.datetime "created_at", null: false
    t.datetime "deleted_at", precision: nil
    t.datetime "enabled_at", precision: nil
    t.string "name"
    t.integer "status", default: 0, null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_lesli_dashboard_accounts_on_account_id"
    t.index ["deleted_at"], name: "index_lesli_dashboard_accounts_on_deleted_at"
  end

  create_table "lesli_dashboard_dashboards", force: :cascade do |t|
    t.integer "account_id", null: false
    t.json "components"
    t.datetime "created_at", null: false
    t.boolean "default"
    t.datetime "deleted_at", precision: nil
    t.string "name"
    t.integer "role_id"
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["account_id"], name: "index_lesli_dashboard_dashboards_on_account_id"
    t.index ["deleted_at"], name: "index_lesli_dashboard_dashboards_on_deleted_at"
    t.index ["role_id"], name: "index_lesli_dashboard_dashboards_on_role_id"
    t.index ["user_id"], name: "index_lesli_dashboard_dashboards_on_user_id"
  end

  create_table "lesli_mailer_accounts", force: :cascade do |t|
    t.integer "account_id", null: false
    t.datetime "created_at", null: false
    t.datetime "deleted_at"
    t.datetime "enabled_at"
    t.string "name"
    t.integer "status", default: 0, null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_lesli_mailer_accounts_on_account_id"
    t.index ["deleted_at"], name: "index_lesli_mailer_accounts_on_deleted_at"
  end

  create_table "lesli_mailer_dashboards", force: :cascade do |t|
    t.integer "account_id", null: false
    t.json "components"
    t.datetime "created_at", null: false
    t.boolean "default"
    t.datetime "deleted_at"
    t.string "name"
    t.integer "role_id"
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["account_id"], name: "index_lesli_mailer_dashboards_on_account_id"
    t.index ["deleted_at"], name: "index_lesli_mailer_dashboards_on_deleted_at"
    t.index ["role_id"], name: "index_lesli_mailer_dashboards_on_role_id"
    t.index ["user_id"], name: "index_lesli_mailer_dashboards_on_user_id"
  end

  create_table "lesli_role_actions", force: :cascade do |t|
    t.integer "action_id"
    t.datetime "created_at", null: false
    t.datetime "deleted_at"
    t.integer "role_id"
    t.datetime "updated_at", null: false
    t.index ["action_id"], name: "descriptor_privileges_system_controller_actions"
    t.index ["deleted_at"], name: "index_lesli_role_actions_on_deleted_at"
    t.index ["role_id"], name: "index_lesli_role_actions_on_role_id"
  end

  create_table "lesli_role_privileges", force: :cascade do |t|
    t.string "action"
    t.boolean "active"
    t.string "controller"
    t.datetime "created_at", null: false
    t.datetime "deleted_at"
    t.integer "role_id"
    t.datetime "updated_at", null: false
    t.index ["controller", "action", "role_id"], name: "role_privileges_index", unique: true
    t.index ["deleted_at"], name: "index_lesli_role_privileges_on_deleted_at"
    t.index ["role_id"], name: "index_lesli_role_privileges_on_role_id"
  end

  create_table "lesli_roles", force: :cascade do |t|
    t.integer "account_id"
    t.boolean "active"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "deleted_at"
    t.string "description"
    t.boolean "isolated", default: false
    t.string "name"
    t.string "path_default"
    t.boolean "path_limited"
    t.integer "permission_level", default: 10
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_lesli_roles_on_account_id"
    t.index ["deleted_at"], name: "index_lesli_roles_on_deleted_at"
  end

  create_table "lesli_settings", force: :cascade do |t|
    t.integer "account_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.string "name"
    t.datetime "updated_at", precision: nil, null: false
    t.integer "user_id"
    t.string "value"
    t.index ["account_id"], name: "index_lesli_settings_on_account_id"
    t.index ["user_id"], name: "index_lesli_settings_on_user_id"
  end

  create_table "lesli_shield_accounts", force: :cascade do |t|
    t.integer "account_id", null: false
    t.datetime "created_at", null: false
    t.datetime "deleted_at", precision: nil
    t.datetime "enabled_at", precision: nil
    t.string "name"
    t.integer "status", default: 0, null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_lesli_shield_accounts_on_account_id"
    t.index ["deleted_at"], name: "index_lesli_shield_accounts_on_deleted_at"
  end

  create_table "lesli_shield_dashboards", force: :cascade do |t|
    t.integer "account_id", null: false
    t.json "components"
    t.datetime "created_at", null: false
    t.boolean "default"
    t.datetime "deleted_at", precision: nil
    t.string "name"
    t.integer "role_id"
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["account_id"], name: "index_lesli_shield_dashboards_on_account_id"
    t.index ["deleted_at"], name: "index_lesli_shield_dashboards_on_deleted_at"
    t.index ["role_id"], name: "index_lesli_shield_dashboards_on_role_id"
    t.index ["user_id"], name: "index_lesli_shield_dashboards_on_user_id"
  end

  create_table "lesli_shield_invites", force: :cascade do |t|
    t.integer "account_id"
    t.datetime "created_at", null: false
    t.datetime "deleted_at"
    t.string "email", null: false
    t.datetime "expired_at"
    t.string "full_name"
    t.text "notes"
    t.datetime "sent_at"
    t.integer "status"
    t.string "telephone"
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["account_id"], name: "index_lesli_shield_invites_on_account_id"
    t.index ["deleted_at"], name: "index_lesli_shield_invites_on_deleted_at"
    t.index ["expired_at"], name: "index_lesli_shield_invites_on_expired_at"
    t.index ["sent_at"], name: "index_lesli_shield_invites_on_sent_at"
    t.index ["status"], name: "index_lesli_shield_invites_on_status"
    t.index ["user_id"], name: "index_lesli_shield_invites_on_user_id"
  end

  create_table "lesli_shield_settings", force: :cascade do |t|
    t.integer "account_id", null: false
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.string "value"
    t.index ["account_id"], name: "index_lesli_shield_settings_on_account_id"
    t.index ["user_id"], name: "index_lesli_shield_settings_on_user_id"
  end

  create_table "lesli_shield_user_shortcuts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "icon"
    t.string "name"
    t.datetime "updated_at", null: false
    t.string "url"
    t.integer "user_id"
    t.index ["user_id"], name: "index_lesli_shield_user_shortcuts_on_user_id"
  end

  create_table "lesli_shield_user_tokens", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "deleted_at"
    t.datetime "expiration_at"
    t.string "name", null: false
    t.string "source", null: false
    t.string "token", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["deleted_at"], name: "index_lesli_shield_user_tokens_on_deleted_at"
    t.index ["expiration_at"], name: "index_lesli_shield_user_tokens_on_expiration_at"
    t.index ["token"], name: "index_lesli_shield_user_tokens_on_token", unique: true
    t.index ["user_id"], name: "index_lesli_shield_user_tokens_on_user_id"
  end

  create_table "lesli_support_accounts", force: :cascade do |t|
    t.integer "account_id", null: false
    t.datetime "created_at", null: false
    t.datetime "deleted_at"
    t.datetime "enabled_at"
    t.string "name"
    t.integer "status", default: 0, null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_lesli_support_accounts_on_account_id"
    t.index ["deleted_at"], name: "index_lesli_support_accounts_on_deleted_at"
  end

  create_table "lesli_support_catalog_items", force: :cascade do |t|
    t.integer "catalog_id", null: false
    t.datetime "created_at", null: false
    t.boolean "default", default: false
    t.string "name"
    t.integer "order"
    t.datetime "updated_at", null: false
    t.index ["catalog_id"], name: "index_lesli_support_catalog_items_on_catalog_id"
  end

  create_table "lesli_support_catalogs", force: :cascade do |t|
    t.integer "account_id", null: false
    t.datetime "created_at", null: false
    t.string "key"
    t.string "name"
    t.integer "parent_id"
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_lesli_support_catalogs_on_account_id"
    t.index ["key"], name: "index_lesli_support_catalogs_on_key"
    t.index ["parent_id"], name: "index_lesli_support_catalogs_on_parent_id"
  end

  create_table "lesli_support_dashboards", force: :cascade do |t|
    t.integer "account_id", null: false
    t.json "components"
    t.datetime "created_at", null: false
    t.boolean "default"
    t.datetime "deleted_at", precision: nil
    t.string "name"
    t.integer "role_id"
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["account_id"], name: "index_lesli_support_dashboards_on_account_id"
    t.index ["deleted_at"], name: "index_lesli_support_dashboards_on_deleted_at"
    t.index ["role_id"], name: "index_lesli_support_dashboards_on_role_id"
    t.index ["user_id"], name: "index_lesli_support_dashboards_on_user_id"
  end

  create_table "lesli_support_settings", force: :cascade do |t|
    t.integer "account_id", null: false
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.string "value"
    t.index ["account_id"], name: "index_lesli_support_settings_on_account_id"
    t.index ["user_id"], name: "index_lesli_support_settings_on_user_id"
  end

  create_table "lesli_support_slas", force: :cascade do |t|
    t.integer "accounts_id"
    t.text "body"
    t.text "client_repercussions"
    t.datetime "created_at", null: false
    t.boolean "default", default: false
    t.datetime "deleted_at", precision: nil
    t.text "exceptions"
    t.integer "expected_resolution_time"
    t.integer "expected_response_time"
    t.string "name"
    t.float "price_per_hour"
    t.text "provider_repercussions"
    t.datetime "updated_at", null: false
    t.integer "users_id"
    t.index ["accounts_id"], name: "index_lesli_support_slas_on_accounts_id"
    t.index ["deleted_at"], name: "index_lesli_support_slas_on_deleted_at"
    t.index ["users_id"], name: "index_lesli_support_slas_on_users_id"
  end

  create_table "lesli_support_ticket_actions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "deleted_at", precision: nil
    t.integer "ticket_id"
    t.string "title"
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["deleted_at"], name: "index_lesli_support_ticket_actions_on_deleted_at"
    t.index ["ticket_id"], name: "index_lesli_support_ticket_actions_on_ticket_id"
    t.index ["user_id"], name: "index_lesli_support_ticket_actions_on_user_id"
  end

  create_table "lesli_support_ticket_activities", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "description"
    t.string "session_id"
    t.integer "ticket_id"
    t.string "title"
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["ticket_id"], name: "index_lesli_support_ticket_activities_on_ticket_id"
    t.index ["user_id"], name: "index_lesli_support_ticket_activities_on_user_id"
  end

  create_table "lesli_support_ticket_attachments", force: :cascade do |t|
    t.string "attachment"
    t.string "attachment_public"
    t.string "attachment_remote"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "deleted_at", precision: nil
    t.string "name"
    t.boolean "public"
    t.string "public_url"
    t.datetime "public_url_expiration_at", precision: nil
    t.decimal "size_mb"
    t.integer "ticket_id"
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["deleted_at"], name: "index_lesli_support_ticket_attachments_on_deleted_at"
    t.index ["ticket_id"], name: "index_lesli_support_ticket_attachments_on_ticket_id"
    t.index ["user_id"], name: "index_lesli_support_ticket_attachments_on_user_id"
  end

  create_table "lesli_support_ticket_discussions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "message"
    t.integer "ticket_id"
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["ticket_id"], name: "index_lesli_support_ticket_discussions_on_ticket_id"
    t.index ["user_id"], name: "index_lesli_support_ticket_discussions_on_user_id"
  end

  create_table "lesli_support_ticket_subscribers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "ticket_id"
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["ticket_id"], name: "index_lesli_support_ticket_subscribers_on_ticket_id"
    t.index ["user_id"], name: "index_lesli_support_ticket_subscribers_on_user_id"
  end

  create_table "lesli_support_ticket_versions", force: :cascade do |t|
    t.string "action"
    t.string "column_name"
    t.datetime "created_at", null: false
    t.integer "ticket_id"
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.string "value_from"
    t.string "value_to"
    t.index ["ticket_id"], name: "index_lesli_support_ticket_versions_on_ticket_id"
    t.index ["user_id"], name: "index_lesli_support_ticket_versions_on_user_id"
  end

  create_table "lesli_support_tickets", force: :cascade do |t|
    t.integer "account_id"
    t.integer "agent_id"
    t.integer "category_id"
    t.datetime "completed_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "deadline", precision: nil
    t.datetime "deleted_at", precision: nil
    t.text "description"
    t.decimal "hours_worked"
    t.integer "priority_id"
    t.string "reference_url"
    t.integer "sla_id"
    t.datetime "started_at", precision: nil
    t.string "subject"
    t.string "tags"
    t.integer "type_id"
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "workspace_id"
    t.index ["account_id"], name: "index_lesli_support_tickets_on_account_id"
    t.index ["agent_id"], name: "index_lesli_support_tickets_on_agent_id"
    t.index ["category_id"], name: "index_lesli_support_tickets_on_category_id"
    t.index ["deleted_at"], name: "index_lesli_support_tickets_on_deleted_at"
    t.index ["priority_id"], name: "index_lesli_support_tickets_on_priority_id"
    t.index ["sla_id"], name: "index_lesli_support_tickets_on_sla_id"
    t.index ["type_id"], name: "index_lesli_support_tickets_on_type_id"
    t.index ["user_id"], name: "index_lesli_support_tickets_on_user_id"
    t.index ["workspace_id"], name: "index_lesli_support_tickets_on_workspace_id"
  end

  create_table "lesli_system_controller_actions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "deleted_at"
    t.string "name"
    t.integer "system_controller_id"
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_lesli_system_controller_actions_on_deleted_at"
    t.index ["system_controller_id"], name: "index_lesli_system_controller_actions_on_system_controller_id"
  end

  create_table "lesli_system_controllers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "deleted_at"
    t.string "engine"
    t.string "name"
    t.string "reference"
    t.string "route"
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_lesli_system_controllers_on_deleted_at"
  end

  create_table "lesli_user_roles", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "deleted_at", precision: nil
    t.integer "role_id"
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["deleted_at"], name: "index_lesli_user_roles_on_deleted_at"
    t.index ["role_id"], name: "index_lesli_user_roles_on_role_id"
    t.index ["user_id"], name: "index_lesli_user_roles_on_user_id"
  end

  create_table "lesli_user_sessions", force: :cascade do |t|
    t.string "agent_browser"
    t.string "agent_os"
    t.string "agent_platform"
    t.string "agent_version"
    t.datetime "created_at", null: false
    t.datetime "deleted_at", precision: nil
    t.datetime "expiration_at", precision: nil
    t.datetime "last_used_at", precision: nil
    t.string "remote"
    t.string "session_source"
    t.string "session_token"
    t.datetime "updated_at", null: false
    t.integer "usage_count"
    t.integer "user_id"
    t.index ["deleted_at"], name: "index_lesli_user_sessions_on_deleted_at"
    t.index ["expiration_at"], name: "index_lesli_user_sessions_on_expiration_at"
    t.index ["user_id"], name: "index_lesli_user_sessions_on_user_id"
  end

  create_table "lesli_users", force: :cascade do |t|
    t.integer "account_id"
    t.boolean "active", default: true, null: false
    t.string "alias"
    t.datetime "confirmation_sent_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "created_at", null: false
    t.datetime "current_sign_in_at"
    t.string "current_sign_in_ip"
    t.datetime "deleted_at"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.integer "failed_attempts", default: 0, null: false
    t.string "first_name"
    t.string "last_name"
    t.datetime "last_sign_in_at"
    t.string "last_sign_in_ip"
    t.datetime "locked_at"
    t.datetime "locked_until"
    t.datetime "password_expiration_at"
    t.datetime "remember_created_at"
    t.datetime "reset_password_sent_at"
    t.string "reset_password_token"
    t.string "salutation"
    t.integer "sign_in_count", default: 0, null: false
    t.string "telephone"
    t.datetime "telephone_confirmation_sent_at"
    t.string "telephone_confirmation_token"
    t.datetime "telephone_confirmed_at"
    t.string "title"
    t.string "unconfirmed_email"
    t.string "unlock_token"
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_lesli_users_on_account_id"
    t.index ["confirmation_token"], name: "index_lesli_users_on_confirmation_token", unique: true
    t.index ["deleted_at"], name: "index_lesli_users_on_deleted_at"
    t.index ["email"], name: "index_lesli_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_lesli_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_lesli_users_on_unlock_token", unique: true
  end

  add_foreign_key "lesli_account_currencies", "lesli_accounts", column: "account_id"
  add_foreign_key "lesli_account_currencies", "lesli_users", column: "user_id"
  add_foreign_key "lesli_account_details", "lesli_accounts", column: "account_id"
  add_foreign_key "lesli_account_locations", "lesli_account_locations", column: "parent_id"
  add_foreign_key "lesli_account_locations", "lesli_accounts", column: "account_id"
  add_foreign_key "lesli_accounts", "lesli_users", column: "user_id"
  add_foreign_key "lesli_admin_accounts", "lesli_accounts", column: "account_id"
  add_foreign_key "lesli_admin_dashboards", "lesli_admin_accounts", column: "account_id"
  add_foreign_key "lesli_admin_dashboards", "lesli_roles", column: "role_id"
  add_foreign_key "lesli_admin_dashboards", "lesli_users", column: "user_id"
  add_foreign_key "lesli_audit_account_devices", "lesli_audit_accounts", column: "account_id"
  add_foreign_key "lesli_audit_account_logs", "lesli_audit_accounts", column: "account_id"
  add_foreign_key "lesli_audit_account_logs", "lesli_users", column: "user_id"
  add_foreign_key "lesli_audit_account_requests", "lesli_audit_accounts", column: "account_id"
  add_foreign_key "lesli_audit_accounts", "lesli_accounts", column: "account_id"
  add_foreign_key "lesli_audit_dashboards", "lesli_audit_accounts", column: "account_id"
  add_foreign_key "lesli_audit_dashboards", "lesli_roles", column: "role_id"
  add_foreign_key "lesli_audit_dashboards", "lesli_users", column: "user_id"
  add_foreign_key "lesli_audit_user_logs", "lesli_audit_accounts", column: "account_id"
  add_foreign_key "lesli_audit_user_logs", "lesli_users", column: "user_id"
  add_foreign_key "lesli_audit_user_requests", "lesli_audit_accounts", column: "account_id"
  add_foreign_key "lesli_audit_user_requests", "lesli_user_sessions", column: "session_id"
  add_foreign_key "lesli_audit_user_requests", "lesli_users", column: "user_id"
  add_foreign_key "lesli_babel_buckets", "lesli_babel_modules", column: "module_id"
  add_foreign_key "lesli_babel_labels", "lesli_babel_buckets", column: "bucket_id"
  add_foreign_key "lesli_bell_accounts", "lesli_accounts", column: "account_id"
  add_foreign_key "lesli_bell_announcement_users", "lesli_bell_announcements", column: "announcement_id"
  add_foreign_key "lesli_bell_announcement_users", "lesli_users", column: "user_id"
  add_foreign_key "lesli_bell_announcements", "lesli_accounts", column: "account_id"
  add_foreign_key "lesli_bell_announcements", "lesli_roles", column: "role_id"
  add_foreign_key "lesli_bell_announcements", "lesli_users", column: "user_id"
  add_foreign_key "lesli_bell_dashboards", "lesli_bell_accounts", column: "account_id"
  add_foreign_key "lesli_bell_dashboards", "lesli_roles", column: "role_id"
  add_foreign_key "lesli_bell_dashboards", "lesli_users", column: "user_id"
  add_foreign_key "lesli_bell_notifications", "lesli_accounts", column: "account_id"
  add_foreign_key "lesli_bell_notifications", "lesli_users", column: "user_id"
  add_foreign_key "lesli_calendar_accounts", "lesli_accounts", column: "account_id"
  add_foreign_key "lesli_calendar_calendars", "lesli_calendar_accounts", column: "account_id"
  add_foreign_key "lesli_calendar_calendars", "lesli_users", column: "user_id"
  add_foreign_key "lesli_calendar_event_attendants", "lesli_calendar_events", column: "event_id"
  add_foreign_key "lesli_calendar_event_attendants", "lesli_users", column: "user_id"
  add_foreign_key "lesli_calendar_events", "lesli_accounts", column: "account_id"
  add_foreign_key "lesli_calendar_events", "lesli_calendar_calendars", column: "calendar_id"
  add_foreign_key "lesli_calendar_events", "lesli_users", column: "user_id"
  add_foreign_key "lesli_dashboard_accounts", "lesli_accounts", column: "account_id"
  add_foreign_key "lesli_dashboard_dashboards", "lesli_dashboard_accounts", column: "account_id"
  add_foreign_key "lesli_dashboard_dashboards", "lesli_roles", column: "role_id"
  add_foreign_key "lesli_dashboard_dashboards", "lesli_users", column: "user_id"
  add_foreign_key "lesli_mailer_accounts", "lesli_accounts", column: "account_id"
  add_foreign_key "lesli_mailer_dashboards", "lesli_mailer_accounts", column: "account_id"
  add_foreign_key "lesli_mailer_dashboards", "lesli_roles", column: "role_id"
  add_foreign_key "lesli_mailer_dashboards", "lesli_users", column: "user_id"
  add_foreign_key "lesli_role_actions", "lesli_roles", column: "role_id"
  add_foreign_key "lesli_role_actions", "lesli_system_controller_actions", column: "action_id"
  add_foreign_key "lesli_role_privileges", "lesli_roles", column: "role_id"
  add_foreign_key "lesli_roles", "lesli_accounts", column: "account_id"
  add_foreign_key "lesli_settings", "lesli_accounts", column: "account_id"
  add_foreign_key "lesli_settings", "lesli_users", column: "user_id"
  add_foreign_key "lesli_shield_accounts", "lesli_accounts", column: "account_id"
  add_foreign_key "lesli_shield_dashboards", "lesli_roles", column: "role_id"
  add_foreign_key "lesli_shield_dashboards", "lesli_shield_accounts", column: "account_id"
  add_foreign_key "lesli_shield_dashboards", "lesli_users", column: "user_id"
  add_foreign_key "lesli_shield_invites", "lesli_shield_accounts", column: "account_id"
  add_foreign_key "lesli_shield_invites", "lesli_users", column: "user_id"
  add_foreign_key "lesli_shield_settings", "lesli_shield_accounts", column: "account_id"
  add_foreign_key "lesli_shield_settings", "lesli_users", column: "user_id"
  add_foreign_key "lesli_shield_user_shortcuts", "lesli_users", column: "user_id"
  add_foreign_key "lesli_shield_user_tokens", "lesli_users", column: "user_id"
  add_foreign_key "lesli_support_accounts", "lesli_accounts", column: "account_id"
  add_foreign_key "lesli_support_catalog_items", "lesli_support_catalogs", column: "catalog_id"
  add_foreign_key "lesli_support_catalogs", "lesli_support_accounts", column: "account_id"
  add_foreign_key "lesli_support_catalogs", "lesli_support_catalogs", column: "parent_id"
  add_foreign_key "lesli_support_dashboards", "lesli_roles", column: "role_id"
  add_foreign_key "lesli_support_dashboards", "lesli_support_accounts", column: "account_id"
  add_foreign_key "lesli_support_dashboards", "lesli_users", column: "user_id"
  add_foreign_key "lesli_support_settings", "lesli_support_accounts", column: "account_id"
  add_foreign_key "lesli_support_settings", "lesli_users", column: "user_id"
  add_foreign_key "lesli_support_slas", "lesli_support_accounts", column: "accounts_id"
  add_foreign_key "lesli_support_slas", "lesli_users", column: "users_id"
  add_foreign_key "lesli_support_ticket_actions", "lesli_support_tickets", column: "ticket_id"
  add_foreign_key "lesli_support_ticket_actions", "lesli_users", column: "user_id"
  add_foreign_key "lesli_support_ticket_activities", "lesli_support_tickets", column: "ticket_id"
  add_foreign_key "lesli_support_ticket_activities", "lesli_users", column: "user_id"
  add_foreign_key "lesli_support_ticket_attachments", "lesli_support_tickets", column: "ticket_id"
  add_foreign_key "lesli_support_ticket_attachments", "lesli_users", column: "user_id"
  add_foreign_key "lesli_support_ticket_discussions", "lesli_support_tickets", column: "ticket_id"
  add_foreign_key "lesli_support_ticket_discussions", "lesli_users", column: "user_id"
  add_foreign_key "lesli_support_ticket_subscribers", "lesli_support_tickets", column: "ticket_id"
  add_foreign_key "lesli_support_ticket_subscribers", "lesli_users", column: "user_id"
  add_foreign_key "lesli_support_ticket_versions", "lesli_support_tickets", column: "ticket_id"
  add_foreign_key "lesli_support_ticket_versions", "lesli_users", column: "user_id"
  add_foreign_key "lesli_support_tickets", "lesli_support_accounts", column: "account_id"
  add_foreign_key "lesli_support_tickets", "lesli_support_catalog_items", column: "category_id"
  add_foreign_key "lesli_support_tickets", "lesli_support_catalog_items", column: "priority_id"
  add_foreign_key "lesli_support_tickets", "lesli_support_catalog_items", column: "type_id"
  add_foreign_key "lesli_support_tickets", "lesli_support_catalog_items", column: "workspace_id"
  add_foreign_key "lesli_support_tickets", "lesli_support_slas", column: "sla_id"
  add_foreign_key "lesli_support_tickets", "lesli_users", column: "agent_id"
  add_foreign_key "lesli_support_tickets", "lesli_users", column: "user_id"
  add_foreign_key "lesli_system_controller_actions", "lesli_system_controllers", column: "system_controller_id"
  add_foreign_key "lesli_user_roles", "lesli_roles", column: "role_id"
  add_foreign_key "lesli_user_roles", "lesli_users", column: "user_id"
  add_foreign_key "lesli_user_sessions", "lesli_users", column: "user_id"
  add_foreign_key "lesli_users", "lesli_accounts", column: "account_id"
end
