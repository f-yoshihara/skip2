class AddSchoolYearToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :school_year, :integer
  end
end
