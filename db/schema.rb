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

ActiveRecord::Schema.define(version: 20160629233828) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "profile_sections", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.string   "section",    null: false
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "profile_sections", ["user_id", "section"], name: "index_profile_sections_on_user_id_and_section", unique: true, using: :btree
  add_index "profile_sections", ["user_id"], name: "index_profile_sections_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username",        null: false
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.string   "session_token",   null: false
    t.string   "zipcode",         null: false
    t.date     "birthday",        null: false
    t.string   "img_url"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "looking_for",     null: false
  end

  add_index "users", ["birthday"], name: "index_users_on_birthday", using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree
  add_index "users", ["zipcode"], name: "index_users_on_zipcode", using: :btree

end