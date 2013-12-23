class CreateTeamMembers < ActiveRecord::Migration
  def change
    create_table "team_members", force: true do |t|
      t.integer  "user_id",                           null: false
      t.integer  "team_id",                           null: false
      t.boolean  "current_member_team_flag", limit: 1, default: 1
      t.boolean  "active_flag", limit: 1, default: 1, null: false
      t.timestamps 
    end
  
    add_index "team_members", ["id"], name: "id_UNIQUE", unique: true, using: :btree
    add_index "team_members", ["team_id"], name: "fk_team_member_teams", using: :btree
    add_index "team_members", ["user_id"], name: "fk_team_member_users", using: :btree
  end
end
