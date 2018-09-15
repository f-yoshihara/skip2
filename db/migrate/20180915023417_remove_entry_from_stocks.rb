class RemoveEntryFromStocks < ActiveRecord::Migration[5.2]
  def change
    remove_column :stocks, :entry, :boolean
  end
end
