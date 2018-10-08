class ChangeRecruitment < ActiveRecord::Migration[5.2]
  def change
    change_table :recruitments do |t|
      t.rename :body, :overview
      t.text   :culture
      t.string :time
      t.string :belongings
      t.string :clothing
      t.text   :notices
    end
  end
end
