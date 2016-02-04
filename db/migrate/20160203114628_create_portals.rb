class CreatePortals < ActiveRecord::Migration
  def change
    create_table :portals do |t|
      t.string :qid
      t.text :ques
      t.string :userid
      t.integer :viewno

      t.timestamps null: false
    end
  end
end
