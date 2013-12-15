class UpdateDefaultSelfhold < ActiveRecord::Migration
  def change
    change_column :pins, :selfhold, :boolean, default: :false
  end
end
