class CreateRecents < ActiveRecord::Migration
  def change
    create_table :recents do |t|
      t.string :userid
      t.text :ques
      t.text :ans
      t.text :vques

      t.timestamps null: false
    end
  end
end
