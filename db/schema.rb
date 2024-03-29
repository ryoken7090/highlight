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

ActiveRecord::Schema.define(version: 2021_06_22_233117) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "diaries", force: :cascade do |t|
    t.text "high_light", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "concentration", null: false, comment: "その日の集中力を10段階で評価"
    t.integer "energy", null: false, comment: "その日に注げたエネルギーを10段階で評価"
    t.text "reflection", default: "", null: false, comment: "その日の反省"
    t.text "thanks", default: "", null: false, comment: "その日誰かに感謝したこと"
    t.datetime "date", null: false, comment: "日付"
  end

end
