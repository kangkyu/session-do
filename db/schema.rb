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

ActiveRecord::Schema[7.1].define(version: 2024_07_10_204449) do
  create_table "tasks", force: :cascade do |t|
    t.string "name", limit: 255
    t.string "comment", limit: 255
    t.datetime "done_at", precision: nil
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.integer "user_id"
    t.boolean "is_daily"
    t.integer "later"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", limit: 255
    t.string "email", limit: 255
    t.string "password_digest", limit: 255
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "auth_token"
    t.index ["auth_token"], name: "index_users_on_auth_token", unique: true
  end

  create_table "visits", force: :cascade do |t|
    t.integer "user_id"
    t.integer "task_id"
    t.text "note"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

end
