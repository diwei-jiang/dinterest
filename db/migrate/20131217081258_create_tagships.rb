class CreateTagships < ActiveRecord::Migration
  def change
    create_table :tagships do |t|
      t.integer :pin_id
      t.integer :tag_id

      t.timestamps
    end
    add_index :tagships, :pin_id
    add_index :tagships, :tag_id
    add_index :tagships, [:pin_id, :tag_id], :unique => true
  end
end
