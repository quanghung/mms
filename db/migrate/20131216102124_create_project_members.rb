class CreateProjectMembers < ActiveRecord::Migration
  def change
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
  end
end
