class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :title
      t.integer :semester, limit: 1
      t.integer :user_id
    end
  end
end
