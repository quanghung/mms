class CreateUserSkills < ActiveRecord::Migration
  def change
    create_table "user_skills", force: true do |t|
      t.integer  "user_id",                                  null: false
      t.integer  "skill_id",                                 null: false
      t.integer  "level",           limit: 1,                null: false
      t.integer  "experience_year"
      t.timestamps 
    end
  
    add_index "user_skills", ["id"], unique: true
    add_index "user_skills", ["skill_id"], name: "index_user_skills_on_skill_id_and_created_at"
    add_index "user_skills", ["user_id"], name: "index_user_skills_on_user_id_and_created_at"
  end
end
