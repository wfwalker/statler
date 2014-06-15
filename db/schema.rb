# encoding: UTF-8
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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140615200837) do

  create_table "artists", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "performances", :force => true do |t|
    t.integer  "artist_id"
    t.integer  "run_id"
    t.integer  "role_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "performances", ["artist_id"], :name => "index_performances_on_artist_id"
  add_index "performances", ["role_id"], :name => "index_performances_on_role_id"
  add_index "performances", ["run_id"], :name => "index_performances_on_run_id"

  create_table "plays", :force => true do |t|
    t.string   "title"
    t.text     "notes"
    t.integer  "premiere_year"
    t.integer  "playwright_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "plays", ["playwright_id"], :name => "index_plays_on_playwright_id"

  create_table "playwrights", :force => true do |t|
    t.string   "name"
    t.text     "notes"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "play_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "roles", ["play_id"], :name => "index_roles_on_play_id"

  create_table "runs", :force => true do |t|
    t.integer  "year"
    t.integer  "venue_id"
    t.integer  "play_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "runs", ["play_id"], :name => "index_runs_on_play_id"
  add_index "runs", ["venue_id"], :name => "index_runs_on_venue_id"

  create_table "venues", :force => true do |t|
    t.string   "name"
    t.string   "organization"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

end
