class CreateTeachers < ActiveRecord::Migration[5.2]
  def change
    create_table :teachers do |t|
      t.string :name
      t.references :school, foreign_key: true
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
