class ChangePhoneOfStaffs < ActiveRecord::Migration[5.2]
  def change
    change_column :staffs, :phone, :string
  end
end
