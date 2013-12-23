class CreateProjectMembers < ActiveRecord::Migration
  def change
    create_table "project_members", force: true do |t|
      t.integer  "project_id",                        null: false
      t.integer  "user_id",                           null: false
      t.boolean  "leader_project_flag", limit: 1, default: 0, null: false
      t.boolean  "active_flag", limit: 1, default: 1, null: false
      t.timestamps 
    end
  
    add_index "project_members", ["id"], name: "id_UNIQUE", unique: true, using: :btree
    add_index "project_members", ["project_id"], name: "fk_project_member_projects", using: :btree
    add_index "project_members", ["user_id"], name: "fk_project_member_users", using: :btree
  end
end
