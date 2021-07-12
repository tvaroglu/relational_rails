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

ActiveRecord::Schema.define(version: 2021_07_10_155953) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "parks", force: :cascade do |t|
    t.string "name"
    t.string "state"
    t.string "county"
    t.integer "parking_fee"
    t.boolean "dogs_allowed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "regions", force: :cascade do |t|
    t.string "name"
    t.boolean "active"
    t.string "rvp_operations"
    t.integer "priority"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "resorts", force: :cascade do |t|
    t.string "name"
    t.string "country"
    t.string "state_province"
    t.boolean "active"
    t.string "director_operations"
    t.integer "ttm_revenue_usd"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "region_id"
    t.index ["region_id"], name: "index_resorts_on_region_id"
  end

  create_table "ski_brands", force: :cascade do |t|
    t.string "name"
    t.boolean "does_racing"
    t.integer "year_founded"
  end

  create_table "skis", force: :cascade do |t|
    t.string "name"
    t.boolean "for_jumps"
    t.float "turn_radius"
    t.bigint "ski_brand_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ski_brand_id"], name: "index_skis_on_ski_brand_id"
  end

  create_table "trails", force: :cascade do |t|
    t.string "name"
    t.integer "length"
    t.integer "elevation_gain"
    t.boolean "loop"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "park_id"
    t.index ["park_id"], name: "index_trails_on_park_id"
  end

  add_foreign_key "resorts", "regions"
  add_foreign_key "skis", "ski_brands"
  add_foreign_key "trails", "parks"
end
