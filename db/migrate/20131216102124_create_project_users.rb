class CreateProjectUsers < ActiveRecord::Migration
  def change
    create_table "project_users", force: true do |t|
      t.integer  "project_id",                          null: false
      t.integer  "user_id",                             null: false
      t.boolean  "leader_flag",                 default: false, null: false
      t.timestamps 
    end
    
    add_index "project_users", ["id"], unique: true
    add_index "project_users", ["project_id"], name: "index_project_users_on_project_id_and_created_at" 
    add_index "project_users", ["user_id"], name: "index_project_users_on_user_id_and_created_at"
  end
end
