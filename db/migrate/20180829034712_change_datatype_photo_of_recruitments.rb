class ChangeDatatypePhotoOfRecruitments < ActiveRecord::Migration[5.2]
  def change
    change_column :recruitments, :photo, :MEDIUMBLOB
  end
end
