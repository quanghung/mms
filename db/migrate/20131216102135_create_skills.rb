class CreateSkills < ActiveRecord::Migration
  def change
    create_table "skills", force: true do |t|
      t.string   "name",        limit: 512,             null: false
      t.integer  "active_flag", limit: 1,   default: 1, null: false
      t.datetime "created_at",                          null: false
      t.datetime "updated_at",                          null: false
    end
  
    add_index "skills", ["id"], name: "id_UNIQUE", unique: true, using: :btree
  end
end
