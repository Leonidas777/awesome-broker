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

ActiveRecord::Schema.define(version: 2018_10_27_141825) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "properties", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.string "preview_url"
    t.string "provider"
    t.boolean "published", default: true
    t.string "external_id"
    t.string "property_type"
    t.string "external_url"
    t.float "price", default: 0.0
    t.float "floor_area", default: 0.0
    t.integer "rooms", default: 0
    t.integer "bathrooms", default: 0
    t.string "city"
    t.datetime "synchronized_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["external_id"], name: "index_properties_on_external_id", unique: true
  end

end
