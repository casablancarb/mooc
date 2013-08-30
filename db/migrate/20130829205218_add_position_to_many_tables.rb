class AddPositionToManyTables < ActiveRecord::Migration
  def change
    add_column :sections, :position, :integer
    add_column :exercises, :position, :integer
    add_column :questions, :position, :integer
  end
end
