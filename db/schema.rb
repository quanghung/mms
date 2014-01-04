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

ActiveRecord::Schema.define(version: 20131217110458) do

  create_table "activities", force: true do |t|
    t.string   "descriptions", null: false
    t.integer  "user_id"
    t.datetime "time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "activities", ["id"], name: "index_activities_on_id", unique: true, using: :btree
  add_index "activities", ["user_id"], name: "index_activities_on_user_id_and_created_at", using: :btree

  create_table "positions", force: true do |t|
    t.string   "name",       limit: 512, null: false
    t.string   "short_name", limit: 45,  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "positions", ["id"], name: "index_positions_on_id", unique: true, using: :btree

  create_table "project_users", force: true do |t|
    t.integer  "project_id",                  null: false
    t.integer  "user_id",                     null: false
    t.boolean  "leader_flag", default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "project_users", ["id"], name: "index_project_users_on_id", unique: true, using: :btree
  add_index "project_users", ["project_id"], name: "index_project_users_on_project_id_and_created_at", using: :btree
  add_index "project_users", ["user_id"], name: "index_project_users_on_user_id_and_created_at", using: :btree

  create_table "projects", force: true do |t|
    t.text     "name",                  null: false
    t.string   "short_name", limit: 45, null: false
    t.date     "start_date",            null: false
    t.date     "end_date",              null: false
    t.integer  "team_id",               null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "projects", ["id"], name: "index_projects_on_id", unique: true, using: :btree
  add_index "projects", ["team_id"], name: "index_projects_on_team_id_and_created_at", using: :btree

  create_table "skills", force: true do |t|
    t.string   "name",       limit: 512, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "skills", ["id"], name: "index_skills_on_id", unique: true, using: :btree

  create_table "teams", force: true do |t|
    t.string   "name",         limit: 512, null: false
    t.text     "descriptions"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "teams", ["id"], name: "index_teams_on_id", unique: true, using: :btree

  create_table "user_skills", force: true do |t|
    t.integer  "user_id",                   null: false
    t.integer  "skill_id",                  null: false
    t.integer  "level",           limit: 1, null: false
    t.integer  "experience_year"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_skills", ["id"], name: "index_user_skills_on_id", unique: true, using: :btree
  add_index "user_skills", ["skill_id"], name: "index_user_skills_on_skill_id_and_created_at", using: :btree
  add_index "user_skills", ["user_id"], name: "index_user_skills_on_user_id_and_created_at", using: :btree

  create_table "users", force: true do |t|
    t.string   "name",            limit: 512,                 null: false
    t.date     "birthday"
    t.string   "email",                                       null: false
    t.boolean  "isAdmin",                     default: false, null: false
    t.integer  "position_id",                                 null: false
    t.integer  "team_id",                                     null: false
    t.integer  "level"
    t.string   "password_digest", limit: 256,                 null: false
    t.string   "remember_token",  limit: 256
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["id"], name: "index_users_on_id", unique: true, using: :btree
  add_index "users", ["position_id"], name: "index_users_on_position_id_and_created_at", using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", length: {"remember_token"=>255}, using: :btree
  add_index "users", ["team_id"], name: "index_users_on_team_id_and_created_at", using: :btree

end
