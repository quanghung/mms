class CreateSkills < ActiveRecord::Migration
  def change
    create_table "skills", force: true do |t|
      t.string   "name",        limit: 512,             null: false
      t.boolean  "active_flag", limit: 1,   default: 1, null: false
      t.timestamps 
    end
  
    add_index "skills", ["id"], name: "id_UNIQUE", unique: true, using: :btree
  end
end
