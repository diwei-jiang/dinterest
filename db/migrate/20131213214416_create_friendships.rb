class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.integer :user1_id
      t.integer :user2_id

      t.timestamps
    end
    add_index :friendships, :user1_id
    add_index :friendships, :user2_id
    add_index :friendships, [:user1_id, :user2_id], :unique => true
  end
end
