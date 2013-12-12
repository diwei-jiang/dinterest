class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :pin_id
      t.integer :user_id
      t.text :content

      t.timestamps
    end
    add_index :comments, :pin_id
  end
end
