class CreateActivities < ActiveRecord::Migration
  def change
    create_table "activities", force: true do |t|
      t.integer  "type",        limit: 1,             null: false
      t.integer  "item_id",                           null: false
      t.datetime "timestamp",                         null: false
      t.boolean  "active_flag", limit: 1, default: 1, null: false
      t.timestamps
    end
  
    add_index "activities", ["id"], name: "id_UNIQUE", unique: true, using: :btree
  end
end
