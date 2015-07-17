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

ActiveRecord::Schema.define(version: 20150717211357) do

  create_table "comments", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",    limit: 4
    t.integer  "victim_id",  limit: 4
    t.string   "body",       limit: 255
  end

  create_table "offense_types", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",       limit: 255
    t.string   "slug",       limit: 255
  end

  create_table "offenses", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "victim_id",       limit: 4
    t.integer  "user_id",         limit: 4
    t.integer  "offense_type_id", limit: 4
    t.string   "name",            limit: 255
    t.string   "duration",        limit: 255
    t.date     "expires_at"
    t.string   "reason",          limit: 255
    t.string   "url",             limit: 255
    t.string   "ip_address",      limit: 255
    t.string   "hostname",        limit: 255
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",            limit: 255
    t.string   "email",           limit: 255
    t.string   "password_digest", limit: 255
    t.string   "otp_secret_key",  limit: 255
    t.boolean  "use_otp",                     default: false
  end

  create_table "victims", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",       limit: 255
  end

end
