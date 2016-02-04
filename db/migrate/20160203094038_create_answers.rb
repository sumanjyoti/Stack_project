class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :qid
      t.string :uid
      t.text :ans
      t.references :question, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
