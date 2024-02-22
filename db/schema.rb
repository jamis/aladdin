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

ActiveRecord::Schema[7.1].define(version: 2024_02_21_134903) do
  create_table "activities", force: :cascade do |t|
    t.string "name", null: false
    t.string "abbv", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "engagements", force: :cascade do |t|
    t.integer "session_id"
    t.integer "resident_id"
    t.boolean "invited", default: false
    t.boolean "attended", default: false
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["resident_id"], name: "index_engagements_on_resident_id"
    t.index ["session_id"], name: "index_engagements_on_session_id"
  end

  create_table "goals", force: :cascade do |t|
    t.string "name", null: false
    t.string "code", null: false
    t.integer "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_id"], name: "index_goals_on_parent_id"
  end

  create_table "goals_sessions", id: false, force: :cascade do |t|
    t.integer "session_id", null: false
    t.integer "goal_id", null: false
  end

  create_table "residents", force: :cascade do |t|
    t.string "name", null: false
    t.string "room", null: false
    t.boolean "current", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sessions", force: :cascade do |t|
    t.integer "activity_id"
    t.date "occurred_on", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["activity_id"], name: "index_sessions_on_activity_id"
  end

end
