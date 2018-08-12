class CreateOccupations < ActiveRecord::Migration[5.2]
  def change
    create_table :occupations do |t|
      t.string :category
      t.integer :interests_count

      t.timestamps
    end
  end
end
