class RenameFriendshipTable < ActiveRecord::Migration
  def change
    rename_table :friendships, :pendingfriendships
  end
end
