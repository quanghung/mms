class CreateUsers < ActiveRecord::Migration
  def change
    create_table "users", force: true do |t|
      t.string   "name",            limit: 512,                null: false
      t.date     "birthday"
      t.string   "email",                                      null: false
      t.boolean  "isAdmin",                    default: false, null: false
      t.integer  "position_id",                                null: false
      t.integer  "team_id",                                    null: false
      t.integer  "level"
      t.string   "password_digest", limit: 256,                null: false
      t.string   "remember_token",  limit: 256
      t.timestamps 
    end
  
    add_index "users", ["id"], unique: true
    add_index "users", ["email"], name: "index_users_on_email", unique: true
    add_index "users", ["position_id"], name: "index_users_on_position_id_and_created_at"
    add_index "users", ["team_id"], name: "index_users_on_team_id_and_created_at"
    add_index "users", ["remember_token"], name: "index_users_on_remember_token"
  end
end
