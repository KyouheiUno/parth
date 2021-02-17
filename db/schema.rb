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

ActiveRecord::Schema.define(version: 2021_02_17_143841) do

  create_table "profession_users", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "profession_id", null: false
    t.index ["profession_id"], name: "index_profession_users_on_profession_id"
    t.index ["user_id"], name: "index_profession_users_on_user_id"
  end

  create_table "professions", force: :cascade do |t|
    t.text "profession_name"
    t.integer "profession_category"
    t.index ["profession_name"], name: "index_professions_on_profession_name", unique: true
  end

  create_table "routines", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.string "category"
    t.integer "todo_monday", default: 0
    t.integer "todo_tuesday", default: 0
    t.integer "todo_wednesday", default: 0
    t.integer "todo_thursday", default: 0
    t.integer "todo_friday", default: 0
    t.integer "todo_saturday", default: 0
    t.integer "todo_sunday", default: 0
    t.integer "todo_holiday", default: 0
    t.time "start_time"
    t.time "close_time"
    t.string "routine_image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category"], name: "index_routines_on_category"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.text "image"
    t.text "profession"
    t.date "birthday"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "gender"
    t.boolean "logical_deletion", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "profession_users", "professions"
  add_foreign_key "profession_users", "users"
end
