class CreateStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :stocks do |t|
      t.references :user, foreign_key: true
      t.references :recruitment, foreign_key: true
      t.boolean :stock
      t.boolean :entry

      t.timestamps
    end
  end
end
