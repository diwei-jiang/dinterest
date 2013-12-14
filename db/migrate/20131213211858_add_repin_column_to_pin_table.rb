class AddRepinColumnToPinTable < ActiveRecord::Migration
  def change
    add_column :pins, :repin_id, :integer, :default => 0
  end
end
