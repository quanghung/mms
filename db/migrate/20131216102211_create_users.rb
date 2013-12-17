class CreateUsers < ActiveRecord::Migration
  def change
    create_table "users", force: true do |t|
      t.string   "name",            limit: 512,             null: false
      t.date     "birthday"
      t.integer  "current_team_id"
      t.integer  "position_id",                             null: false
      t.string   "email",           limit: 512,             null: false
      t.string   "password_digest", limit: 256,             null: false
      t.string   "remember_token",  limit: 256
      t.integer  "active_flag",     limit: 1,   default: 1, null: false
      t.datetime "created_at",                              null: false
      t.datetime "updated_at",                              null: false
    end
  
    add_index "users", ["id"], name: "id_UNIQUE", unique: true, using: :btree
    add_index "users", ["position_id"], name: "fk_user_positions", using: :btree
  end
end
