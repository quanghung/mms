class CreateTeams < ActiveRecord::Migration
  def change
    create_table "teams", force: true do |t|
      t.string   "name",         limit: 512,             null: false
      t.integer  "leader_id",                            null: false
      t.text     "descriptions"
      t.integer  "active_flag",  limit: 1,   default: 1, null: false
      t.datetime "created_at",                           null: false
      t.string   "updated_at",   limit: 45,              null: false
    end
  end
end
