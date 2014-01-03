class CreateProjects < ActiveRecord::Migration
  def change
    create_table "projects", force: true do |t|
      t.text     "name",                                   null: false
      t.string   "short_name", limit: 45,                null: false
      t.date     "start_date",                             null: false
      t.date     "end_date",                               null: false
      t.integer  "team_id",                                null: false
      t.timestamps 
    end
  
    add_index "projects", ["id"], unique: true 
    add_index "projects", ["team_id"], name: "index_projects_on_team_id_and_created_at"
  end
end