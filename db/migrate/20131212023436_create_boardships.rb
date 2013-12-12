class CreateBoardships < ActiveRecord::Migration
  def change
    create_table :boardships do |t|
      t.integer :board_id
      t.integer :follower_id

      t.timestamps
    end
    add_index :boardships, :board_id
    add_index :boardships, :follower_id
    add_index :boardships, [:board_id, :follower_id], unique: true
  end
end
