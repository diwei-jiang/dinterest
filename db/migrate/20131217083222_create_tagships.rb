class CreateTagships < ActiveRecord::Migration
  def change
    drop_table :tagships

    create_table :tagships do |t|
      t.belongs_to :tag, index: true
      t.belongs_to :pin, index: true

      t.timestamps
    end
  end
end
