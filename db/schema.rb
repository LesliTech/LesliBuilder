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

ActiveRecord::Schema[7.0].define(version: 10000310) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "lesli_accounts", force: :cascade do |t|
    t.integer "status"
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
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_lesli_accounts_on_user_id"
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

  add_foreign_key "lesli_accounts", "lesli_users", column: "user_id"
  add_foreign_key "lesli_users", "lesli_accounts", column: "account_id"
end
