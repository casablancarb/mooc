class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.string :title
      t.text :description
      t.string :video_url
      t.integer :section_id
    end
  end
end
