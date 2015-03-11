class CreateTime < ActiveRecord::Migration
  def change
    create_table :commits do |t|
      t.string :commit_message
      t.timestamps
    end
  end
end
