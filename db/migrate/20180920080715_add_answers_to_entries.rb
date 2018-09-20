class AddAnswersToEntries < ActiveRecord::Migration[5.2]
  def change
    change_table :entries do |t|
      t.integer :status, default:0, null: false
      t.text :answer1
      t.text :answer2
      t.text :answer3
      t.text :answer4
      t.text :answer5
    end
  end
end
