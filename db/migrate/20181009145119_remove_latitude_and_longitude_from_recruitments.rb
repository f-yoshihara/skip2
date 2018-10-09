class RemoveLatitudeAndLongitudeFromRecruitments < ActiveRecord::Migration[5.2]
  def change
    remove_column :recruitments, :latitude, :float
    remove_column :recruitments, :longitude, :float
  end
end
