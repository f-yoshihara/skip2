class ChangeStaffs < ActiveRecord::Migration[5.2]
  def change
    change_table :staffs do |t|
      t.remove :family_name, :first_name, :phone
      t.string :name
    end
  end
end
