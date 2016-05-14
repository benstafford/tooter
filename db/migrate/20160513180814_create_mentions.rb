class CreateMentions < ActiveRecord::Migration
  def change
    create_table :mentions do |t|
      t.integer :toot_id
      t.integer :user_id

      t.timestamps
    end
  end
end
