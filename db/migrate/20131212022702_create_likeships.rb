class CreateLikeships < ActiveRecord::Migration
  def change
    create_table :likeships do |t|
      t.integer :user_id
      t.integer :pin_id

      t.timestamps
    end
    add_index :likeships, :user_id
    add_index :likeships, :pin_id
    add_index :likeships, [:user_id, :pin_id], unique: true
  end
end
