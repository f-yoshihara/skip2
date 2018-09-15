class CreateEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :entries do |t|
      t.references :user, foreign_key: true
      t.references :recruitment, foreign_key: true
      t.index [:user_id, :recruitment_id], unique: true

      t.timestamps
    end
  end
end
