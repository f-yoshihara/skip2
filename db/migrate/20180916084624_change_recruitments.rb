class ChangeRecruitments < ActiveRecord::Migration[5.2]
  def change
    change_table :recruitments do |t|
      t.integer :capacity
      t.string :location
      t.text :question1
      t.text :question2
      t.text :question3
      t.text :question4
      t.text :question5
    end
  end
end
