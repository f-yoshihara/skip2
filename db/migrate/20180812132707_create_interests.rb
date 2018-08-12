class CreateInterests < ActiveRecord::Migration[5.2]
  def change
    create_table :interests do |t|
      t.references :student, foreign_key: true
      t.references :industry, foreign_key: true
      t.references :occupation, foreign_key: true

      t.timestamps
    end
  end
end
