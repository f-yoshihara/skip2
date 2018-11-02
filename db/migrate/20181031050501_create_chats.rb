class CreateChats < ActiveRecord::Migration[5.2]
  def change
    create_table :chats do |t|
      t.references :school, foreign_key: true
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
