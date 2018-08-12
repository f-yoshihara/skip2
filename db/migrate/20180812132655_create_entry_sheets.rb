class CreateEntrySheets < ActiveRecord::Migration[5.2]
  def change
    create_table :entry_sheets do |t|
      t.references :student, foreign_key: true
      t.references :recruitment, foreign_key: true
      t.integer :status
      t.text :why
      t.text :what
      t.text :how

      t.timestamps
    end
  end
end
