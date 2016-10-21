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

<<<<<<< 331cdac7d96c571c2e87879d7831abdae57d5f37
ActiveRecord::Schema.define(version: 20161013161011) do
=======
ActiveRecord::Schema.define(version: 20161013100145) do
>>>>>>> Change new of DB to WeatherRecording from CurrentWeather. Connect weather to locations db

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
    t.decimal  "temperature",   precision: 10
    t.decimal  "precipitation", precision: 10
    t.decimal  "windspeed",     precision: 10
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "location_id"
<<<<<<< 331cdac7d96c571c2e87879d7831abdae57d5f37
    t.datetime "recorded_at"
=======
>>>>>>> Change new of DB to WeatherRecording from CurrentWeather. Connect weather to locations db
  end

end
