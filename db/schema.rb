# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150701125853) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "service_id"
    t.string   "status"
    t.string   "pricing_nature"
    t.datetime "starts_at"
    t.integer  "duration"
    t.text     "description"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "loge_id"
  end

  add_index "bookings", ["loge_id"], name: "index_bookings_on_loge_id", using: :btree
  add_index "bookings", ["service_id"], name: "index_bookings_on_service_id", using: :btree
  add_index "bookings", ["user_id"], name: "index_bookings_on_user_id", using: :btree

  create_table "contacts", force: :cascade do |t|
    t.string   "address"
    t.string   "email"
    t.boolean  "newsletter"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "loges", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.date     "created_on"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.float    "latitude"
    t.float    "longitude"
  end

  create_table "memberships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "loge_id"
    t.date     "member_since"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "memberships", ["loge_id"], name: "index_memberships_on_loge_id", using: :btree
  add_index "memberships", ["user_id"], name: "index_memberships_on_user_id", using: :btree

  create_table "messages", force: :cascade do |t|
    t.integer  "booking_id"
    t.integer  "user_id"
    t.datetime "posted_at"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "messages", ["booking_id"], name: "index_messages_on_booking_id", using: :btree
  add_index "messages", ["user_id"], name: "index_messages_on_user_id", using: :btree

  create_table "reviews", force: :cascade do |t|
    t.integer  "booking_id"
    t.text     "description"
    t.boolean  "recommendation"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "reviews", ["booking_id"], name: "index_reviews_on_booking_id", using: :btree

  create_table "services", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "category"
    t.string   "title"
    t.text     "description"
    t.string   "pricing_nature"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "services", ["user_id"], name: "index_services_on_user_id", using: :btree

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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address"
    t.date     "birthday"
    t.integer  "number_of_children"
    t.text     "occupation"
    t.text     "personal_description"
    t.integer  "neighbour_since"
    t.string   "favorite_shop"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "provider"
    t.string   "uid"
    t.string   "picture"
    t.string   "name"
    t.string   "token"
    t.datetime "token_expiry"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "bookings", "services"
  add_foreign_key "bookings", "users"
  add_foreign_key "memberships", "loges"
  add_foreign_key "memberships", "users"
  add_foreign_key "messages", "bookings"
  add_foreign_key "messages", "users"
  add_foreign_key "reviews", "bookings"
  add_foreign_key "services", "users"
end
