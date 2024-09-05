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

ActiveRecord::Schema[7.2].define(version: 2024_09_05_053417) do
  create_table "challenge_stakeholders", force: :cascade do |t|
    t.integer "challenge_id", null: false
    t.integer "stakeholder_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["challenge_id"], name: "index_challenge_stakeholders_on_challenge_id"
    t.index ["stakeholder_id"], name: "index_challenge_stakeholders_on_stakeholder_id"
  end

  create_table "challenges", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "category"
    t.string "subcategory"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "responses", force: :cascade do |t|
    t.integer "stakeholder_id", null: false
    t.integer "challenge_id", null: false
    t.integer "impact_materiality"
    t.integer "financial_materiality"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["challenge_id"], name: "index_responses_on_challenge_id"
    t.index ["stakeholder_id"], name: "index_responses_on_stakeholder_id"
  end

  create_table "stakeholders", force: :cascade do |t|
    t.string "name"
    t.string "role"
    t.string "category"
    t.string "subcategory"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "challenge_stakeholders", "challenges"
  add_foreign_key "challenge_stakeholders", "stakeholders"
  add_foreign_key "responses", "challenges"
  add_foreign_key "responses", "stakeholders"
end
