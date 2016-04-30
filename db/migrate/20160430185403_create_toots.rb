class CreateToots < ActiveRecord::Migration
  def change
    create_table :toots do |t|
      t.string :body

      t.timestamps null: false
    end
  end
end
