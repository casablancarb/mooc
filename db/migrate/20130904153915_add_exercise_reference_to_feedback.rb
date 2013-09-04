class AddExerciseReferenceToFeedback < ActiveRecord::Migration
  def change
    add_column :feedback, :exercise_id, :integer
  end
end
