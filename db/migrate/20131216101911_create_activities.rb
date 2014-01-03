class CreateActivities < ActiveRecord::Migration
  def change
    create_table "activities", force: true do |t|
      t.string   "descriptions",                         null: false
      t.integer  "user_id"
      t.datetime "time"
      t.timestamps
    end

    add_index "activities", ["id"], unique: true
    add_index "activities", ["user_id"], name: "index_activities_on_user_id_and_created_at"
  end
end