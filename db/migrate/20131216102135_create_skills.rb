class CreateSkills < ActiveRecord::Migration
  def change
    create_table "skills", force: true do |t|
      t.string   "name",        limit: 512,             null: false
      t.timestamps 
    end

    add_index "skills", ["id"], unique: true
  end
end
