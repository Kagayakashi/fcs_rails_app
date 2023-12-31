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

ActiveRecord::Schema[7.1].define(version: 2023_12_11_144158) do
  create_table "buildings", force: :cascade do |t|
    t.integer "order", null: false
    t.integer "type_id", null: false
    t.integer "level", default: 0, null: false
    t.integer "wood_requirement", default: 0, null: false
    t.integer "stone_requirement", default: 0, null: false
    t.integer "iron_requirement", default: 0, null: false
    t.integer "food_requirement", default: 0, null: false
    t.integer "time_requirement", default: 0, null: false
    t.integer "build_time", default: 0, null: false
    t.boolean "is_under_construction", default: false, null: false
    t.integer "castle_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["castle_id"], name: "index_buildings_on_castle_id"
  end

  create_table "castles", force: :cascade do |t|
    t.string "name", null: false
    t.integer "x", null: false
    t.integer "y", null: false
    t.integer "food", default: 500, null: false
    t.integer "wood", default: 500, null: false
    t.integer "stone", default: 500, null: false
    t.integer "iron", default: 500, null: false
    t.boolean "is_main", default: false, null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_castles_on_user_id"
    t.index ["x", "y"], name: "index_castles_on_x_and_y", unique: true
  end

  create_table "races", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", null: false
    t.integer "race_id", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "buildings", "castles"
  add_foreign_key "castles", "users"
end
