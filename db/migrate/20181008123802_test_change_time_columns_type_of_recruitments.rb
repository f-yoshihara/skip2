class TestChangeTimeColumnsTypeOfRecruitments < ActiveRecord::Migration[5.2]
  def change
    change_table :recruitments do |t|
      t.change :start_time, :time
      t.change :end_time, :time
    end
  end
end
