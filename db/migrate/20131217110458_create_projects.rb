class CreateProjects < ActiveRecord::Migration
  def change
    create_table "projects", force: true do |t|
      t.text     "name",                                null: false
      t.string   "abbreviation", limit: 45,             null: false
      t.date     "start_date",                          null: false
      t.date     "end_date",                            null: false
      t.integer  "team_id",                             null: false
      t.boolean  "active_flag",  limit: 1,  default: 1, null: false
      t.timestamps 
    end
  
    add_index "projects", ["id"], name: "id_UNIQUE", unique: true, using: :btree
    add_index "projects", ["team_id"], name: "fk_project_teams", using: :btree
  end
end