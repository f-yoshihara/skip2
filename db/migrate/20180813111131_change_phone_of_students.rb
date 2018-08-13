class ChangePhoneOfStudents < ActiveRecord::Migration[5.2]
  def change
    change_column :students, :phone, :string
  end
end
