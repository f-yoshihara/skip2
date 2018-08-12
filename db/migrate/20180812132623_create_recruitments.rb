class CreateRecruitments < ActiveRecord::Migration[5.2]
  def change
    create_table :recruitments do |t|
      t.references :company, foreign_key: true
      t.references :occupation, foreign_key: true
      t.integer :status
      t.string :title
      t.text :body
      t.date :deadline

      t.timestamps
    end
  end
end
