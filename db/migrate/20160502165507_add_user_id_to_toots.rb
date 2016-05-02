class AddUserIdToToots < ActiveRecord::Migration
  def change
    add_column :toots, :user_id, :integer
  end
end
