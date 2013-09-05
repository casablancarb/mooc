class AddPublishedAttrToExercise < ActiveRecord::Migration
  def change
    add_column :exercises, :published, :boolean
  end
end
