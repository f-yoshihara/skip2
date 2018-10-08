class ChangeTimeColumnsOfRecruitments < ActiveRecord::Migration[5.2]
  def change
    change_table :recruitments do |t|
      t.change :time, :time
      t.rename :time, :start_time
      t.time   :end_time
    end
  end
end
