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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20131216102211) do

  create_table "activities", force: true do |t|
    t.integer  "type",        limit: 1,             null: false
    t.integer  "item_id",                           null: false
    t.datetime "timestamp",                         null: false
    t.integer  "active_flag", limit: 1, default: 1, null: false
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  add_index "activities", ["id"], name: "id_UNIQUE", unique: true, using: :btree

  create_table "admins", force: true do |t|
    t.string   "email",           limit: 512,             null: false
    t.string   "password_digest", limit: 256,             null: false
    t.string   "remember_token",  limit: 256
    t.integer  "active_flag",     limit: 1,   default: 1, null: false
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  add_index "admins", ["id"], name: "id_UNIQUE", unique: true, using: :btree

  create_table "positions", force: true do |t|
    t.string   "name",         limit: 512,             null: false
    t.string   "abbreviation", limit: 45,              null: false
    t.integer  "active_flag",  limit: 1,   default: 1, null: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "positions", ["id"], name: "id_UNIQUE", unique: true, using: :btree

  create_table "project_members", force: true do |t|
    t.integer  "project_id",                        null: false
    t.integer  "user_id",                           null: false
    t.integer  "active_flag", limit: 1, default: 1, null: false
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  add_index "project_members", ["id"], name: "id_UNIQUE", unique: true, using: :btree
  add_index "project_members", ["project_id"], name: "fk_project_member_projects", using: :btree
  add_index "project_members", ["user_id"], name: "fk_project_member_users", using: :btree

  create_table "skills", force: true do |t|
    t.string   "name",        limit: 512,             null: false
    t.integer  "active_flag", limit: 1,   default: 1, null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "skills", ["id"], name: "id_UNIQUE", unique: true, using: :btree

  create_table "team_members", force: true do |t|
    t.integer  "user_id",                           null: false
    t.integer  "team_id",                           null: false
    t.integer  "active_flag", limit: 1, default: 1, null: false
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  add_index "team_members", ["id"], name: "id_UNIQUE", unique: true, using: :btree
  add_index "team_members", ["team_id"], name: "fk_team_member_teams", using: :btree
  add_index "team_members", ["user_id"], name: "fk_team_member_users", using: :btree

  create_table "teams", force: true do |t|
    t.string   "name",         limit: 512,             null: false
    t.integer  "leader_id",                            null: false
    t.text     "descriptions"
    t.integer  "active_flag",  limit: 1,   default: 1, null: false
    t.datetime "created_at",                           null: false
    t.string   "updated_at",   limit: 45,              null: false
  end

  create_table "user_skills", force: true do |t|
    t.integer  "user_id",                               null: false
    t.integer  "skill_id",                              null: false
    t.integer  "level",           limit: 1,             null: false
    t.integer  "experience_year"
    t.text     "descriptions"
    t.integer  "active_flag",     limit: 1, default: 1, null: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "user_skills", ["skill_id"], name: "fk_user_skill_skills", using: :btree
  add_index "user_skills", ["user_id"], name: "fk_user_skill_users", using: :btree

  create_table "users", force: true do |t|
    t.string   "name",            limit: 512,             null: false
    t.date     "birthday"
    t.integer  "current_team_id"
    t.integer  "position_id",                             null: false
    t.string   "email",           limit: 512,             null: false
    t.string   "password_digest", limit: 256,             null: false
    t.string   "remember_token",  limit: 256
    t.integer  "active_flag",     limit: 1,   default: 1, null: false
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  add_index "users", ["id"], name: "id_UNIQUE", unique: true, using: :btree
  add_index "users", ["position_id"], name: "fk_user_positions", using: :btree

end
