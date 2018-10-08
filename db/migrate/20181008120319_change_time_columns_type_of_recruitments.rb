class ChangeTimeColumnsTypeOfRecruitments < ActiveRecord::Migration[5.2]
  def change
    change_table :recruitments do |t|
      t.change :start_time, :string
      t.change :end_time, :string
    end
  end
end
