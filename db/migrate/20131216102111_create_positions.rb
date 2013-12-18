class CreatePositions < ActiveRecord::Migration
  def change
    create_table "positions", force: true do |t|
      t.string   "name",         limit: 512,             null: false
      t.string   "abbreviation", limit: 45,              null: false
      t.boolean  "active_flag",  limit: 1,   default: 1, null: false
      t.timestamps 
    end
  
    add_index "positions", ["id"], name: "id_UNIQUE", unique: true, using: :btree
  end
end
