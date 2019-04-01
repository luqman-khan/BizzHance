# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20190401055731) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attendances", force: :cascade do |t|
    t.date     "date"
    t.datetime "check_in"
    t.string   "check_out"
    t.string   "datetime"
    t.string   "hourly_pay"
    t.string   "decimal"
    t.decimal  "total_pay"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_attendances_on_user_id", using: :btree
  end

  create_table "customers", force: :cascade do |t|
    t.string   "name"
    t.string   "phone"
    t.decimal  "total_purchase"
    t.decimal  "total_repair"
    t.integer  "organization_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["organization_id"], name: "index_customers_on_organization_id", using: :btree
  end

  create_table "images", force: :cascade do |t|
    t.string   "name"
    t.string   "image_url"
    t.integer  "repair_id"
    t.integer  "sale_id"
    t.integer  "organization_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.index ["organization_id"], name: "index_images_on_organization_id", using: :btree
    t.index ["repair_id"], name: "index_images_on_repair_id", using: :btree
    t.index ["sale_id"], name: "index_images_on_sale_id", using: :btree
  end

  create_table "organizations", force: :cascade do |t|
    t.string   "name"
    t.string   "owner"
    t.text     "contact"
    t.text     "address"
    t.boolean  "authorize"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "repairs", force: :cascade do |t|
    t.text     "item_name"
    t.text     "problem_description"
    t.text     "item_condition"
    t.text     "repair_description"
    t.text     "charge_note"
    t.decimal  "data_saving"
    t.decimal  "total_charge"
    t.integer  "user_id"
    t.integer  "customer_id"
    t.integer  "organization_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["customer_id"], name: "index_repairs_on_customer_id", using: :btree
    t.index ["organization_id"], name: "index_repairs_on_organization_id", using: :btree
    t.index ["user_id"], name: "index_repairs_on_user_id", using: :btree
  end

  create_table "sales", force: :cascade do |t|
    t.text     "item_sold"
    t.decimal  "item_price"
    t.text     "note"
    t.datetime "date_of_sale"
    t.integer  "user_id"
    t.integer  "customer_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["customer_id"], name: "index_sales_on_customer_id", using: :btree
    t.index ["user_id"], name: "index_sales_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "name"
    t.string   "role"
    t.decimal  "current_pay_rate"
    t.datetime "rate_since"
    t.boolean  "authorize"
    t.integer  "organization_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["organization_id"], name: "index_users_on_organization_id", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "attendances", "users"
  add_foreign_key "customers", "organizations"
  add_foreign_key "images", "organizations"
  add_foreign_key "images", "repairs"
  add_foreign_key "images", "sales"
  add_foreign_key "repairs", "customers"
  add_foreign_key "repairs", "organizations"
  add_foreign_key "repairs", "users"
  add_foreign_key "sales", "customers"
  add_foreign_key "sales", "users"
end
