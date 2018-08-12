class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :password_digest
      t.date :established
      t.string :url

      t.timestamps
    end
  end
end
