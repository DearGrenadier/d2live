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

ActiveRecord::Schema.define(version: 20190322125450) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bans", force: :cascade do |t|
    t.bigint "hero_id"
    t.bigint "match_id"
    t.boolean "radiant", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hero_id", "match_id"], name: "index_bans_on_hero_id_and_match_id", unique: true
    t.index ["hero_id"], name: "index_bans_on_hero_id"
    t.index ["match_id"], name: "index_bans_on_match_id"
  end

  create_table "chats", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "heroes", force: :cascade do |t|
    t.json "raw", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "leagues", force: :cascade do |t|
    t.json "raw", null: false
    t.datetime "created_at", default: "2019-03-14 14:09:48", null: false
    t.datetime "updated_at", default: "2019-03-14 14:09:48", null: false
  end

  create_table "matches", force: :cascade do |t|
    t.json "raw", null: false
    t.boolean "finished", default: false, null: false
    t.datetime "created_at", default: "2019-03-14 14:09:48", null: false
    t.datetime "updated_at", default: "2019-03-14 14:09:48", null: false
  end

  create_table "picks", force: :cascade do |t|
    t.bigint "match_id"
    t.bigint "hero_id"
    t.bigint "player_id"
    t.boolean "radiant", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hero_id"], name: "index_picks_on_hero_id"
    t.index ["match_id", "hero_id"], name: "index_picks_on_match_id_and_hero_id", unique: true
    t.index ["match_id"], name: "index_picks_on_match_id"
    t.index ["player_id"], name: "index_picks_on_player_id"
  end

  create_table "players", force: :cascade do |t|
    t.json "raw", null: false
    t.bigint "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_players_on_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.json "raw", null: false
  end

end
