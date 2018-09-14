class CreateJoinTableUserRecruitment < ActiveRecord::Migration[5.2]
  def change
    create_join_table :users, :recruitments
  end
end
