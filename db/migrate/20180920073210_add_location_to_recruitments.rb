class AddLocationToRecruitments < ActiveRecord::Migration[5.2]
  def change
    change_table :recruitments do |t|
      t.string :prefecture
      t.string :city
      t.string :street
    end
  end
end
