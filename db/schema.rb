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

ActiveRecord::Schema.define(version: 20151122134034) do

  create_table "activities", force: :cascade do |t|
    t.string   "user_name"
    t.string   "user_avatar"
    t.integer  "action"
    t.integer  "target"
    t.text     "data"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "idea_id"
  end

  create_table "ideas", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "inbox_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "card_id"
    t.integer  "user_id"
  end

  create_table "inboxes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "title"
    t.string   "board_id"
    t.integer  "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "avatar"
    t.boolean  "creator",    default: false
    t.boolean  "admin",      default: false
  end

end
