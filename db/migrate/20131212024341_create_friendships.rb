class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.integer :sender_id
      t.integer :receiver_id
      t.boolean :conformation

      t.timestamps
    end
    add_index :friendships, [:sender_id, :receiver_id], unique: true
  end
end
