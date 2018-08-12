class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :family_name
      t.string :first_name
      t.string :password_digest
      t.date :birthday
      t.string :email
      t.integer :phone
      t.boolean :dm
      t.integer :school_year
      t.string :school_name
      t.integer :school_course

      t.timestamps
    end
  end
end
