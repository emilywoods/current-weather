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

ActiveRecord::Schema.define(version: 20161107105809) do

  create_table "delayed_jobs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "priority",                 default: 0, null: false
    t.integer  "attempts",                 default: 0, null: false
    t.text     "handler",    limit: 65535,             null: false
    t.text     "last_error", limit: 65535
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree
  end

  create_table "locations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.float    "latitude",    limit: 24
    t.float    "longitude",   limit: 24
    t.datetime "recorded_at"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["latitude", "longitude"], name: "index_locations_on_latitude_and_longitude", unique: true, using: :btree
  end

  create_table "weather_recordings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "description"
    t.decimal  "temperature",              precision: 10
    t.decimal  "precipitation",            precision: 10
    t.decimal  "windspeed",                precision: 10
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.integer  "location_id"
    t.datetime "recorded_at"
    t.string   "name"
    t.float    "latitude",      limit: 24
    t.float    "longitude",     limit: 24
  end

end
