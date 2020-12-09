# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_12_09_062833) do

  create_table "drivers", force: :cascade do |t|
    t.string "name"
    t.string "driver_photo"
    t.integer "driver_number"
    t.integer "tier"
    t.integer "team_id"
    t.string "bio"
    t.string "crew_chief"
    t.integer "manufacturer_id"
    t.string "number_photo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "manufacturers", force: :cascade do |t|
    t.string "logo"
    t.string "make"
    t.integer "teams_count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "teams", force: :cascade do |t|
    t.integer "championships"
    t.string "bio"
    t.integer "manufacturer_id"
    t.string "name"
    t.integer "stable_count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
