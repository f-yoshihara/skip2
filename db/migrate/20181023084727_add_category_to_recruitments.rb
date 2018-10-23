class AddCategoryToRecruitments < ActiveRecord::Migration[5.2]
  def change
    add_column :recruitments, :category, :integer, default: 0, null: false
  end
end
