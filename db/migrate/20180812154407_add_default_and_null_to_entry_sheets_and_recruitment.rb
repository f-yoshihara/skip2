class AddDefaultAndNullToEntrySheetsAndRecruitment < ActiveRecord::Migration[5.2]
  def change
    change_column_default :entry_sheets, :status, 0
    change_column_default :recruitments, :status, 0
    change_column_null :entry_sheets, :status, false
    change_column_null :recruitments, :status, false
  end
end
