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

ActiveRecord::Schema.define(version: 2021_06_20_052357) do

  create_table "tasks", force: :cascade do |t|
    t.string "name", limit: 255
    t.string "comment", limit: 255
    t.datetime "done_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "user_id"
    t.boolean "is_daily"
    t.integer "next"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", limit: 255
    t.string "email", limit: 255
    t.string "password_digest", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "visits", force: :cascade do |t|
    t.integer "user_id"
    t.integer "task_id"
    t.text "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
