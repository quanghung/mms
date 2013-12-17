class CreatePositions < ActiveRecord::Migration
  def change
    create_table "positions", force: true do |t|
      t.string   "name",         limit: 512,             null: false
      t.string   "abbreviation", limit: 45,              null: false
      t.integer  "active_flag",  limit: 1,   default: 1, null: false
      t.datetime "created_at",                           null: false
      t.datetime "updated_at",                           null: false
    end
  
    add_index "positions", ["id"], name: "id_UNIQUE", unique: true, using: :btree
  end
end
