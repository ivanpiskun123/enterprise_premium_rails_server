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

ActiveRecord::Schema.define(version: 2022_11_14_173744) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "achievements", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.text "description", default: "", null: false
    t.integer "points"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "bids", force: :cascade do |t|
    t.boolean "status", default: false, null: false
    t.datetime "approved_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "worker_id"
    t.bigint "premium_for_score_id"
    t.bigint "user_id"
    t.index ["premium_for_score_id"], name: "index_bids_on_premium_for_score_id"
    t.index ["user_id"], name: "index_bids_on_user_id"
    t.index ["worker_id"], name: "index_bids_on_worker_id"
  end

  create_table "departaments", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.text "description", default: "", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "positions", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_positions_on_name", unique: true
  end

  create_table "premium_for_scores", force: :cascade do |t|
    t.integer "amount", null: false
    t.integer "score", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "premium_funds", force: :cascade do |t|
    t.integer "fund_amount", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "jti", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "role_id"
    t.bigint "departament_id"
    t.index ["departament_id"], name: "index_users_on_departament_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["jti"], name: "index_users_on_jti", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  create_table "worker_achievements", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "achievement_id"
    t.bigint "worker_id"
    t.boolean "is_credited", default: false, null: false
    t.index ["achievement_id"], name: "index_worker_achievements_on_achievement_id"
    t.index ["worker_id"], name: "index_worker_achievements_on_worker_id"
  end

  create_table "worker_images", force: :cascade do |t|
    t.string "image_url", null: false
    t.string "reference_type"
    t.bigint "reference_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["reference_type", "reference_id"], name: "index_worker_images_on_reference"
  end

  create_table "workers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "first_name", default: "", null: false
    t.string "second_name", default: "", null: false
    t.string "phone_number"
    t.float "exp", default: 0.0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "position_id"
    t.bigint "departament_id"
    t.index ["departament_id"], name: "index_workers_on_departament_id"
    t.index ["email"], name: "index_workers_on_email", unique: true
    t.index ["position_id"], name: "index_workers_on_position_id"
  end

  add_foreign_key "workers", "positions"
end
