class CreateAlternatives < ActiveRecord::Migration
  def change
    create_table :alternatives do |t|
      t.string :body
      t.string :explanation
      t.boolean :truth_value
      t.integer :question_id
    end
  end
end
