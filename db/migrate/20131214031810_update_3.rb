class Update3 < ActiveRecord::Migration
  def change
    add_column :friendships, :conformation, :boolean
  end
end
