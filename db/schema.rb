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

ActiveRecord::Schema.define(version: 2019_09_28_184110) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "matches", force: :cascade do |t|
    t.datetime "started_at"
    t.bigint "home_team_id"
    t.bigint "guest_team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["guest_team_id"], name: "index_matches_on_guest_team_id"
    t.index ["home_team_id"], name: "index_matches_on_home_team_id"
  end

  create_table "players", force: :cascade do |t|
    t.bigint "team_id"
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["last_name"], name: "index_players_on_last_name"
    t.index ["team_id"], name: "index_players_on_team_id"
  end

  create_table "scores", force: :cascade do |t|
    t.bigint "match_id"
    t.bigint "player_id"
    t.bigint "team_id"
    t.integer "min_played", default: 0
    t.integer "goals", default: 0
    t.integer "assists", default: 0
    t.integer "yellow", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["assists"], name: "index_scores_on_assists"
    t.index ["goals"], name: "index_scores_on_goals"
    t.index ["match_id"], name: "index_scores_on_match_id"
    t.index ["player_id"], name: "index_scores_on_player_id"
    t.index ["team_id"], name: "index_scores_on_team_id"
    t.index ["yellow"], name: "index_scores_on_yellow"
  end

  create_table "teams", force: :cascade do |t|
    t.string "club_title", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["club_title"], name: "index_teams_on_club_title"
  end

  add_foreign_key "players", "teams"
  add_foreign_key "scores", "matches"
  add_foreign_key "scores", "players"
  add_foreign_key "scores", "teams"
end
