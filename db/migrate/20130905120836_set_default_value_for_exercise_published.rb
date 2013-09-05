class SetDefaultValueForExercisePublished < ActiveRecord::Migration
  def change
    change_column_default :exercises, :published, false
  end
end
