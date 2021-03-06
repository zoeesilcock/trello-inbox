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

ActiveRecord::Schema.define(version: 20160321141714) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string   "user_name"
    t.string   "user_avatar"
    t.integer  "action"
    t.integer  "target"
    t.text     "data"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "idea_id"
    t.string   "action_id"
  end

  create_table "comments", force: :cascade do |t|
    t.string   "user_name"
    t.string   "user_avatar"
    t.text     "text"
    t.integer  "idea_id"
    t.string   "action_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "comment_id"
  end

  create_table "field_values", force: :cascade do |t|
    t.integer  "field_id"
    t.integer  "idea_id"
    t.text     "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fields", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.boolean  "required"
    t.integer  "sorting"
    t.integer  "inbox_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "ideas", force: :cascade do |t|
    t.string   "title"
    t.integer  "inbox_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "card_id"
    t.integer  "user_id"
    t.string   "list_id"
  end

  create_table "ideas_labels", force: :cascade do |t|
    t.integer  "idea_id"
    t.integer  "label_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inboxes", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "title"
    t.string   "board_id"
    t.integer  "user_id"
    t.text     "description"
  end

  create_table "labels", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "text"
    t.string   "color"
    t.string   "trello_id"
  end

  create_table "lists", force: :cascade do |t|
    t.string   "list_id"
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "inbox_id"
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
