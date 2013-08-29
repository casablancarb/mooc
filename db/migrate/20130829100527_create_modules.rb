class CreateModules < ActiveRecord::Migration
  def change
    create_table :modules do |t|
      t.string :title
      t.text :description
      t.integer :course_id
    end
  end
end
