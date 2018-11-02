class RenameTeachersStocksToFollowing < ActiveRecord::Migration[5.2]
  def change
    rename_table :teachers_stocks, :followings
  end
end
