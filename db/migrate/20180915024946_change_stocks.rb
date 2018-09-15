class ChangeStocks < ActiveRecord::Migration[5.2]
  def change
    change_table :stocks do |t|
      t.remove :stock
      t.index [:user_id, :recruitment_id], unique: true
    end
  end
end
