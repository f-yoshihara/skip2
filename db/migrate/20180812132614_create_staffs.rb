class CreateStaffs < ActiveRecord::Migration[5.2]
  def change
    create_table :staffs do |t|
      t.references :company, foreign_key: true
      t.string :family_name
      t.string :first_name
      t.string :password_digest
      t.string :email
      t.integer :phone

      t.timestamps
    end
  end
end
