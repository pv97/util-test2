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

ActiveRecord::Schema.define(version: 20170308191237) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "api_usages", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.float    "cost",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "plans", force: :cascade do |t|
    t.integer  "utility_id",               null: false
    t.float    "time_of_use", default: [], null: false, array: true
    t.float    "tiers",       default: [], null: false, array: true
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "subscriptions", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "utility_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",        null: false
    t.string   "password_digest", null: false
    t.string   "session_token",   null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["session_token"], name: "index_users_on_session_token", using: :btree
    t.index ["username"], name: "index_users_on_username", unique: true, using: :btree
  end

  create_table "utilities", force: :cascade do |t|
    t.string   "company_name", null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "utility_usages", force: :cascade do |t|
    t.integer  "subscription_id", null: false
    t.float    "kWh_used",        null: false
    t.datetime "start_time",      null: false
    t.datetime "end_time",        null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
