class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.references :recruitment, foreign_key: true

      t.timestamps
    end
  end
end
