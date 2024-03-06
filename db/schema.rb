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
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "lesli_account_activities", force: :cascade do |t|
    t.string "description"
    t.string "field_name"
    t.string "value_from"
    t.string "value_to"
    t.string "category"
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "account_id"
    t.index ["account_id"], name: "index_lesli_account_activities_on_account_id"
  end

  create_table "lesli_account_logs", force: :cascade do |t|
    t.string "system_module"
    t.string "system_process"
    t.string "description"
    t.string "title"
    t.json "payload"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "lesli_account_id"
    t.index ["lesli_account_id"], name: "index_lesli_account_logs_on_lesli_account_id"
  end

  create_table "lesli_account_settings", force: :cascade do |t|
    t.string "name"
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "account_id"
    t.index ["account_id"], name: "index_lesli_account_settings_on_account_id"
  end

  create_table "lesli_accounts", force: :cascade do |t|
    t.integer "status"
    t.string "email"
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
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "user_id"
    t.index ["deleted_at"], name: "index_lesli_accounts_on_deleted_at"
    t.index ["user_id"], name: "index_lesli_accounts_on_user_id"
  end

  create_table "lesli_babel_buckets", force: :cascade do |t|
    t.string "code"
    t.string "reference_module"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "module_id"
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
    t.bigint "bucket_id"
    t.index ["bucket_id"], name: "index_lesli_babel_strings_on_bucket_id"
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
    t.bigint "descriptor_id"
    t.index ["descriptor_id"], name: "index_lesli_descriptor_activities_on_descriptor_id"
  end

  create_table "lesli_descriptor_privileges", force: :cascade do |t|
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "descriptor_id"
    t.bigint "action_id"
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
    t.bigint "account_id"
    t.index ["account_id"], name: "index_lesli_descriptors_on_account_id"
    t.index ["deleted_at"], name: "index_lesli_descriptors_on_deleted_at"
  end

  create_table "lesli_guard_accounts", force: :cascade do |t|
    t.integer "status"
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "account_id"
    t.index ["account_id"], name: "index_lesli_guard_accounts_on_account_id"
    t.index ["deleted_at"], name: "index_lesli_guard_accounts_on_deleted_at"
  end

  create_table "lesli_guard_dashboard_components", force: :cascade do |t|
    t.string "name"
    t.string "component_id"
    t.integer "layout"
    t.integer "index"
    t.json "query_configuration"
    t.json "custom_configuration"
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "dashboard_id"
    t.index ["dashboard_id"], name: "lesli_guard_dashboard_components_index"
  end

  create_table "lesli_guard_dashboards", force: :cascade do |t|
    t.string "name"
    t.boolean "default"
    t.boolean "main"
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "account_id"
    t.bigint "user_id"
    t.index ["account_id"], name: "index_lesli_guard_dashboards_on_account_id"
    t.index ["user_id"], name: "index_lesli_guard_dashboards_on_user_id"
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
    t.bigint "user_id"
    t.bigint "role_id"
    t.bigint "descriptor_id"
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
    t.bigint "role_id"
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
    t.bigint "account_id"
    t.index ["account_id"], name: "index_lesli_roles_on_account_id"
    t.index ["deleted_at"], name: "index_lesli_roles_on_deleted_at"
  end

  create_table "lesli_system_controller_actions", force: :cascade do |t|
    t.string "name"
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "system_controller_id"
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
    t.bigint "work_city"
    t.bigint "work_region"
    t.bigint "work_address"
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["deleted_at"], name: "index_lesli_user_details_on_deleted_at"
    t.index ["user_id"], name: "index_lesli_user_details_on_user_id"
  end

  create_table "lesli_user_logs", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "session_id"
    t.index ["session_id"], name: "index_lesli_user_logs_on_session_id"
    t.index ["user_id"], name: "index_lesli_user_logs_on_user_id"
  end

  create_table "lesli_user_powers", force: :cascade do |t|
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["deleted_at"], name: "index_lesli_user_powers_on_deleted_at"
    t.index ["role_id"], name: "index_lesli_user_powers_on_role_id"
    t.index ["user_id"], name: "index_lesli_user_powers_on_user_id"
  end

  create_table "lesli_user_sessions", force: :cascade do |t|
    t.inet "remote"
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
    t.bigint "user_id"
    t.index ["deleted_at"], name: "index_lesli_user_sessions_on_deleted_at"
    t.index ["expiration_at"], name: "index_lesli_user_sessions_on_expiration_at"
    t.index ["user_id"], name: "index_lesli_user_sessions_on_user_id"
  end

  create_table "lesli_user_settings", force: :cascade do |t|
    t.string "name"
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
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
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
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
    t.bigint "account_id"
    t.index ["account_id"], name: "index_lesli_users_on_account_id"
    t.index ["confirmation_token"], name: "index_lesli_users_on_confirmation_token", unique: true
    t.index ["deleted_at"], name: "index_lesli_users_on_deleted_at"
    t.index ["email"], name: "index_lesli_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_lesli_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_lesli_users_on_unlock_token", unique: true
  end

  add_foreign_key "lesli_account_activities", "lesli_accounts", column: "account_id"
  add_foreign_key "lesli_account_logs", "lesli_accounts"
  add_foreign_key "lesli_account_settings", "lesli_accounts", column: "account_id"
  add_foreign_key "lesli_accounts", "lesli_users", column: "user_id"
  add_foreign_key "lesli_babel_buckets", "lesli_babel_modules", column: "module_id"
  add_foreign_key "lesli_babel_strings", "lesli_babel_buckets", column: "bucket_id"
  add_foreign_key "lesli_descriptor_activities", "lesli_descriptors", column: "descriptor_id"
  add_foreign_key "lesli_descriptor_privileges", "lesli_descriptors", column: "descriptor_id"
  add_foreign_key "lesli_descriptor_privileges", "lesli_system_controller_actions", column: "action_id"
  add_foreign_key "lesli_descriptors", "lesli_accounts", column: "account_id"
  add_foreign_key "lesli_guard_accounts", "lesli_accounts", column: "account_id"
  add_foreign_key "lesli_guard_dashboard_components", "lesli_guard_dashboards", column: "dashboard_id"
  add_foreign_key "lesli_guard_dashboards", "lesli_guard_accounts", column: "account_id"
  add_foreign_key "lesli_guard_dashboards", "lesli_users", column: "user_id"
  add_foreign_key "lesli_role_powers", "lesli_descriptors", column: "descriptor_id"
  add_foreign_key "lesli_role_powers", "lesli_roles", column: "role_id"
  add_foreign_key "lesli_role_powers", "lesli_users", column: "user_id"
  add_foreign_key "lesli_role_privileges", "lesli_roles", column: "role_id"
  add_foreign_key "lesli_roles", "lesli_accounts", column: "account_id"
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
