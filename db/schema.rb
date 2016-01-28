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

ActiveRecord::Schema.define(version: 20160128101004) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "age"
    t.string   "phone"
    t.text     "motivation"
    t.boolean  "validated"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "session_id"
    t.string   "state"
    t.string   "session_sku"
    t.integer  "amount_cents", default: 0, null: false
    t.json     "payment"
  end

  add_index "bookings", ["session_id"], name: "index_bookings_on_session_id", using: :btree

  create_table "courses", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "sessions", force: :cascade do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.string   "location"
    t.integer  "course_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "sku"
    t.integer  "price_cents", default: 0, null: false
  end

  add_index "sessions", ["course_id"], name: "index_sessions_on_course_id", using: :btree

  add_foreign_key "bookings", "sessions"
  add_foreign_key "sessions", "courses"
end
