class SetDefaultValueForPosition < ActiveRecord::Migration
  def change
    change_column_default :sections, :position, 0
    change_column_default :exercises, :position, 0
    change_column_default :questions, :position, 0
  end
end
