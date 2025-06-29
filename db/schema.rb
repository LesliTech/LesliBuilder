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

ActiveRecord::Schema[7.2].define(version: 801120410) do
  create_table "lesli_account_activities", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "session_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "account_id"
    t.index ["account_id"], name: "index_lesli_account_activities_on_account_id"
    t.index ["user_id"], name: "index_lesli_account_activities_on_user_id"
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

  create_table "lesli_accounts", force: :cascade do |t|
    t.string "status", null: false
    t.string "name"
    t.string "email", null: false
    t.string "region", default: "america"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["deleted_at"], name: "index_lesli_accounts_on_deleted_at"
    t.index ["email"], name: "index_lesli_accounts_on_email", unique: true
    t.index ["user_id"], name: "index_lesli_accounts_on_user_id"
  end

  create_table "lesli_mailer_accounts", force: :cascade do |t|
    t.string "name"
    t.integer "status", default: 0, null: false
    t.datetime "enabled_at"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "account_id", null: false
    t.index ["account_id"], name: "index_lesli_mailer_accounts_on_account_id"
    t.index ["deleted_at"], name: "index_lesli_mailer_accounts_on_deleted_at"
  end

  create_table "lesli_mailer_dashboards", force: :cascade do |t|
    t.string "name"
    t.boolean "default"
    t.json "components"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "role_id"
    t.integer "account_id", null: false
    t.index ["account_id"], name: "index_lesli_mailer_dashboards_on_account_id"
    t.index ["deleted_at"], name: "index_lesli_mailer_dashboards_on_deleted_at"
    t.index ["role_id"], name: "index_lesli_mailer_dashboards_on_role_id"
    t.index ["user_id"], name: "index_lesli_mailer_dashboards_on_user_id"
  end

  create_table "lesli_role_actions", force: :cascade do |t|
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role_id"
    t.integer "action_id"
    t.index ["action_id"], name: "descriptor_privileges_system_controller_actions"
    t.index ["deleted_at"], name: "index_lesli_role_actions_on_deleted_at"
    t.index ["role_id"], name: "index_lesli_role_actions_on_role_id"
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
    t.integer "permission_level", default: 10
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "account_id"
    t.index ["account_id"], name: "index_lesli_roles_on_account_id"
    t.index ["deleted_at"], name: "index_lesli_roles_on_deleted_at"
  end

  create_table "lesli_settings", force: :cascade do |t|
    t.string "name"
    t.string "value"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "user_id"
    t.integer "account_id", null: false
    t.index ["account_id"], name: "index_lesli_settings_on_account_id"
    t.index ["user_id"], name: "index_lesli_settings_on_user_id"
  end

  create_table "lesli_shield_accounts", force: :cascade do |t|
    t.string "name"
    t.integer "status", default: 0, null: false
    t.datetime "enabled_at", precision: nil
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "account_id", null: false
    t.index ["account_id"], name: "index_lesli_shield_accounts_on_account_id"
    t.index ["deleted_at"], name: "index_lesli_shield_accounts_on_deleted_at"
  end

  create_table "lesli_shield_dashboards", force: :cascade do |t|
    t.string "name"
    t.boolean "default"
    t.json "components"
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "role_id"
    t.integer "account_id", null: false
    t.index ["account_id"], name: "index_lesli_shield_dashboards_on_account_id"
    t.index ["deleted_at"], name: "index_lesli_shield_dashboards_on_deleted_at"
    t.index ["role_id"], name: "index_lesli_shield_dashboards_on_role_id"
    t.index ["user_id"], name: "index_lesli_shield_dashboards_on_user_id"
  end

  create_table "lesli_shield_settings", force: :cascade do |t|
    t.string "name"
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "account_id", null: false
    t.index ["account_id"], name: "index_lesli_shield_settings_on_account_id"
    t.index ["user_id"], name: "index_lesli_shield_settings_on_user_id"
  end

  create_table "lesli_shield_user_shortcuts", force: :cascade do |t|
    t.string "name"
    t.string "icon"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_lesli_shield_user_shortcuts_on_user_id"
  end

  create_table "lesli_shield_user_tokens", force: :cascade do |t|
    t.string "name", null: false
    t.string "token", null: false
    t.string "source", null: false
    t.datetime "expiration_at"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["deleted_at"], name: "index_lesli_shield_user_tokens_on_deleted_at"
    t.index ["expiration_at"], name: "index_lesli_shield_user_tokens_on_expiration_at"
    t.index ["token"], name: "index_lesli_shield_user_tokens_on_token", unique: true
    t.index ["user_id"], name: "index_lesli_shield_user_tokens_on_user_id"
  end

  create_table "lesli_support_accounts", force: :cascade do |t|
    t.string "name"
    t.integer "status", default: 0, null: false
    t.datetime "enabled_at"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "account_id", null: false
    t.index ["account_id"], name: "index_lesli_support_accounts_on_account_id"
    t.index ["deleted_at"], name: "index_lesli_support_accounts_on_deleted_at"
  end

  create_table "lesli_support_catalog_items", force: :cascade do |t|
    t.string "name"
    t.integer "order"
    t.boolean "default", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "catalog_id", null: false
    t.index ["catalog_id"], name: "index_lesli_support_catalog_items_on_catalog_id"
  end

  create_table "lesli_support_catalogs", force: :cascade do |t|
    t.string "key"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "parent_id"
    t.integer "account_id", null: false
    t.index ["account_id"], name: "index_lesli_support_catalogs_on_account_id"
    t.index ["key"], name: "index_lesli_support_catalogs_on_key"
    t.index ["parent_id"], name: "index_lesli_support_catalogs_on_parent_id"
  end

  create_table "lesli_support_dashboards", force: :cascade do |t|
    t.string "name"
    t.boolean "default"
    t.json "components"
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "role_id"
    t.integer "account_id", null: false
    t.index ["account_id"], name: "index_lesli_support_dashboards_on_account_id"
    t.index ["deleted_at"], name: "index_lesli_support_dashboards_on_deleted_at"
    t.index ["role_id"], name: "index_lesli_support_dashboards_on_role_id"
    t.index ["user_id"], name: "index_lesli_support_dashboards_on_user_id"
  end

  create_table "lesli_support_settings", force: :cascade do |t|
    t.string "name"
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "account_id", null: false
    t.index ["account_id"], name: "index_lesli_support_settings_on_account_id"
    t.index ["user_id"], name: "index_lesli_support_settings_on_user_id"
  end

  create_table "lesli_support_ticket_actions", force: :cascade do |t|
    t.string "title"
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "ticket_id"
    t.index ["deleted_at"], name: "index_lesli_support_ticket_actions_on_deleted_at"
    t.index ["ticket_id"], name: "index_lesli_support_ticket_actions_on_ticket_id"
    t.index ["user_id"], name: "index_lesli_support_ticket_actions_on_user_id"
  end

  create_table "lesli_support_ticket_activities", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "session_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "ticket_id"
    t.index ["ticket_id"], name: "index_lesli_support_ticket_activities_on_ticket_id"
    t.index ["user_id"], name: "index_lesli_support_ticket_activities_on_user_id"
  end

  create_table "lesli_support_ticket_attachments", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.decimal "size_mb"
    t.string "attachment"
    t.string "attachment_remote"
    t.string "attachment_public"
    t.boolean "public"
    t.string "public_url"
    t.datetime "public_url_expiration_at", precision: nil
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "ticket_id"
    t.index ["deleted_at"], name: "index_lesli_support_ticket_attachments_on_deleted_at"
    t.index ["ticket_id"], name: "index_lesli_support_ticket_attachments_on_ticket_id"
    t.index ["user_id"], name: "index_lesli_support_ticket_attachments_on_user_id"
  end

  create_table "lesli_support_ticket_discussions", force: :cascade do |t|
    t.string "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "ticket_id"
    t.index ["ticket_id"], name: "index_lesli_support_ticket_discussions_on_ticket_id"
    t.index ["user_id"], name: "index_lesli_support_ticket_discussions_on_user_id"
  end

  create_table "lesli_support_ticket_subscribers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "ticket_id"
    t.index ["ticket_id"], name: "index_lesli_support_ticket_subscribers_on_ticket_id"
    t.index ["user_id"], name: "index_lesli_support_ticket_subscribers_on_user_id"
  end

  create_table "lesli_support_ticket_versions", force: :cascade do |t|
    t.string "column_name"
    t.string "value_from"
    t.string "value_to"
    t.string "action"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "ticket_id"
    t.index ["ticket_id"], name: "index_lesli_support_ticket_versions_on_ticket_id"
    t.index ["user_id"], name: "index_lesli_support_ticket_versions_on_user_id"
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
    t.integer "workspace_id"
    t.integer "type_id"
    t.integer "category_id"
    t.integer "priority_id"
    t.integer "user_id"
    t.integer "agent_id"
    t.integer "account_id"
    t.index ["account_id"], name: "index_lesli_support_tickets_on_account_id"
    t.index ["agent_id"], name: "index_lesli_support_tickets_on_agent_id"
    t.index ["category_id"], name: "index_lesli_support_tickets_on_category_id"
    t.index ["deleted_at"], name: "index_lesli_support_tickets_on_deleted_at"
    t.index ["priority_id"], name: "index_lesli_support_tickets_on_priority_id"
    t.index ["type_id"], name: "index_lesli_support_tickets_on_type_id"
    t.index ["user_id"], name: "index_lesli_support_tickets_on_user_id"
    t.index ["workspace_id"], name: "index_lesli_support_tickets_on_workspace_id"
  end

  create_table "lesli_system_controller_actions", force: :cascade do |t|
    t.string "name"
    t.datetime "deleted_at"
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
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_lesli_system_controllers_on_deleted_at"
  end

  create_table "lesli_user_activities", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "session_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_lesli_user_activities_on_user_id"
  end

  create_table "lesli_user_roles", force: :cascade do |t|
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "role_id"
    t.index ["deleted_at"], name: "index_lesli_user_roles_on_deleted_at"
    t.index ["role_id"], name: "index_lesli_user_roles_on_role_id"
    t.index ["user_id"], name: "index_lesli_user_roles_on_user_id"
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

  create_table "lesli_users", force: :cascade do |t|
    t.boolean "active", default: true, null: false
    t.string "alias"
    t.string "title"
    t.string "salutation"
    t.string "first_name"
    t.string "last_name"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "password_expiration_at"
    t.datetime "locked_until"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "unconfirmed_email"
    t.string "confirmation_token"
    t.datetime "confirmation_sent_at"
    t.datetime "confirmed_at"
    t.string "telephone"
    t.string "telephone_confirmation_token"
    t.datetime "telephone_confirmation_sent_at"
    t.datetime "telephone_confirmed_at"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "account_id"
    t.index ["account_id"], name: "index_lesli_users_on_account_id"
    t.index ["confirmation_token"], name: "index_lesli_users_on_confirmation_token", unique: true
    t.index ["deleted_at"], name: "index_lesli_users_on_deleted_at"
    t.index ["email"], name: "index_lesli_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_lesli_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_lesli_users_on_unlock_token", unique: true
  end

  add_foreign_key "lesli_account_activities", "lesli_accounts", column: "account_id"
  add_foreign_key "lesli_account_activities", "lesli_users", column: "user_id"
  add_foreign_key "lesli_account_details", "lesli_accounts", column: "account_id"
  add_foreign_key "lesli_accounts", "lesli_users", column: "user_id"
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
  add_foreign_key "lesli_support_tickets", "lesli_support_catalogs", column: "workspace_id"
  add_foreign_key "lesli_support_tickets", "lesli_users", column: "agent_id"
  add_foreign_key "lesli_support_tickets", "lesli_users", column: "user_id"
  add_foreign_key "lesli_system_controller_actions", "lesli_system_controllers", column: "system_controller_id"
  add_foreign_key "lesli_user_activities", "lesli_users", column: "user_id"
  add_foreign_key "lesli_user_roles", "lesli_roles", column: "role_id"
  add_foreign_key "lesli_user_roles", "lesli_users", column: "user_id"
  add_foreign_key "lesli_user_sessions", "lesli_users", column: "user_id"
  add_foreign_key "lesli_users", "lesli_accounts", column: "account_id"
end
