class RenameColumnVideoUrlToVideoIdOnExercises < ActiveRecord::Migration
  def change
    rename_column :exercises, :video_url, :video_id
  end
end
