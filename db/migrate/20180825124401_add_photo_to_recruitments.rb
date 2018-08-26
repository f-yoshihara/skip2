class AddPhotoToRecruitments < ActiveRecord::Migration[5.2]
  def change
    add_column :recruitments, :photo, :blob
  end
end
