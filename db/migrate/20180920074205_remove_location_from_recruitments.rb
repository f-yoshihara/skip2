class RemoveLocationFromRecruitments < ActiveRecord::Migration[5.2]
  def change
    remove_column :recruitments, :location, :string
  end
end
