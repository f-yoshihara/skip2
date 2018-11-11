class AddSchoolToMessage < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :school, :boolean
  end
end
