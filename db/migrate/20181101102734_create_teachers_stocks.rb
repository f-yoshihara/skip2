class CreateTeachersStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :teachers_stocks do |t|
      t.references :teacher, foreign_key: true
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
