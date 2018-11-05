class AddOverviewToCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :overview, :text
  end
end
