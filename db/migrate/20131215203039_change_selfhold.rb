class ChangeSelfhold < ActiveRecord::Migration
  def change
    remove_column :pins, :selfhold
    add_column :pins, :s3_filename, :string
  end
end
