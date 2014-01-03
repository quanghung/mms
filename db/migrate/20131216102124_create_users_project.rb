class CreateUsersProject < ActiveRecord::Migration
  def change
    create_table "users_project", force: true do |t|
      t.integer  "project_id",                          null: false
      t.integer  "user_id",                             null: false
      t.boolean  "leader_flag",                 default: false, null: false
      t.timestamps 
    end
    
    add_index "users_project", ["id"], unique: true
    add_index "users_project", ["project_id"], name: "index_user_project_on_project_id_and_created_at" 
    add_index "users_project", ["user_id"], name: "index_user_project_on_user_id_and_created_at"
  end
end
