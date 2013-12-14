class Update2 < ActiveRecord::Migration
  def change
    drop_table :pendingfriendships
    rename_column :friendships, :user1_id, :sender_id
    rename_column :friendships, :user2_id, :receiver_id
  end
end
