class CreateTeams < ActiveRecord::Migration
  def change
    create_table "teams", force: true do |t|
      t.string   "name",         limit: 512,             null: false
      t.integer  "leader_id",                            null: false
      t.text     "descriptions"
      t.boolean  "active_flag",  limit: 1,   default: 1, null: false
      t.timestamps 
    end
  end
end
