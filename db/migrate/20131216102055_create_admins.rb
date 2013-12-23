class CreateAdmins < ActiveRecord::Migration
  def change
    create_table "admins", force: true do |t|
      t.string   "email",           limit: 512,             null: false
      t.string   "password_digest", limit: 256,             null: false
      t.string   "remember_token",  limit: 256
      t.boolean  "active_flag",     limit: 1,   default: 1, null: false
      t.timestamps 
    end
  
    add_index "admins", ["id"], name: "id_UNIQUE", unique: true, using: :btree
  end
end
