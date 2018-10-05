class AddScheduleToRecruitments < ActiveRecord::Migration[5.2]
  def change
    add_column :recruitments, :schedule, :date
  end
end
