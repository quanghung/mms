class CreateUserSkills < ActiveRecord::Migration
  def change
    create_table "user_skills", force: true do |t|
      t.integer  "user_id",                               null: false
      t.integer  "skill_id",                              null: false
      t.integer  "level",           limit: 1,             null: false
      t.integer  "experience_year"
      t.text     "descriptions"
      t.boolean  "active_flag",     limit: 1, default: 1, null: false
      t.timestamps 
    end
  
    add_index "user_skills", ["skill_id"], name: "fk_user_skill_skills", using: :btree
    add_index "user_skills", ["user_id"], name: "fk_user_skill_users", using: :btree
  end
end
