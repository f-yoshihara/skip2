class CreateEmploymentEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :employment_entries do |t|
      t.references :user, foreign_key: true
      t.references :recruitment, foreign_key: true
      t.index [:user_id, :recruitment_id], unique: true
      t.integer :status, default:0, null: false
      t.text :answer1
      t.text :answer2
      t.text :answer3
      t.text :answer4
      t.text :answer5
      t.timestamps
    end
  end
end
