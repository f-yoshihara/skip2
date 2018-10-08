class RenameOverviewToBody < ActiveRecord::Migration[5.2]
  def change
    rename_column :recruitments, :overview, :body
  end
end
