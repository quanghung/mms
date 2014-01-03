class CreatePositions < ActiveRecord::Migration
  def change
    create_table "positions", force: true do |t|
      t.string   "name",         limit: 512,                null: false
      t.string   "short_name",   limit: 45,                 null: false
      t.timestamps 
    end

    add_index "positions", ["id"], unique: true
  end
end
