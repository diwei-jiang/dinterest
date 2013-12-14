class Update1 < ActiveRecord::Migration
  def change
    remove_column :pendingfriendships, :conformation
  end
end
