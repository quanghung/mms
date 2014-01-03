class CreateTeams < ActiveRecord::Migration
  def change
    create_table "teams", force: true do |t|
      t.string   "name",         limit: 512,                null: false
      t.text     "descriptions"
      t.timestamps 
    end

    add_index "teams", ["id"], unique: true
  end
end
