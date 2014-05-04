class AddActivationToUser < ActiveRecord::Migration
  def change
    add_column :users, :activation_token, :string
    add_column :users, :active, :boolean
  end
end
