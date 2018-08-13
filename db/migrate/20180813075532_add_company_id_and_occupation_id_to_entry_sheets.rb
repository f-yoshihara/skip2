class AddCompanyIdAndOccupationIdToEntrySheets < ActiveRecord::Migration[5.2]
  def change
    add_reference :entry_sheets, :company, foreign_key: true
    add_reference :entry_sheets, :occupation, foreign_key: true
  end
end