class RenameMicropostTable < ActiveRecord::Migration
  def change
    rename_table :microposts, :pins
  end
end
