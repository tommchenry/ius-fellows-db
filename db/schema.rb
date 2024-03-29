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

ActiveRecord::Schema[7.0].define(version: 2020_04_19_221225) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: nil
    t.datetime "remember_created_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "deposits", force: :cascade do |t|
    t.integer "deposit_number"
    t.date "date_processed"
    t.string "check_number"
    t.integer "fellow_id"
    t.integer "fellow_number"
    t.date "check_date"
    t.string "payment_by"
    t.string "payment_type"
    t.string "deposit_type"
    t.integer "gift_amount_cents", default: 0, null: false
    t.string "gift_amount_currency", default: "USD", null: false
    t.string "period"
    t.integer "amount_cents", default: 0, null: false
    t.string "amount_currency", default: "USD", null: false
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fellows", force: :cascade do |t|
    t.integer "fellow_id"
    t.string "title"
    t.string "first_name"
    t.string "last_name"
    t.string "address_1"
    t.string "address_2"
    t.string "city"
    t.string "state"
    t.string "zip_code"
    t.string "country"
    t.string "work_telephone"
    t.string "home_telephone"
    t.string "fax"
    t.string "email"
    t.string "gender"
    t.string "ethnicity"
    t.string "nationality"
    t.string "fellow_type"
    t.string "academic_discipline"
    t.string "consulting"
    t.string "affiliation"
    t.string "position"
    t.string "last_dues_paid"
    t.string "council"
    t.boolean "board_dir"
    t.string "status"
    t.string "transaction_status"
    t.string "transaction_number"
    t.string "report_to_transaction"
    t.boolean "list_maker"
    t.date "date_joined"
    t.boolean "include_in_roster"
    t.string "reason_terminated"
    t.date "date_terminated"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
