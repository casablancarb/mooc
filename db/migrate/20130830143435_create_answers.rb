class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :alternative_id
      t.integer :user_id
    end
  end
end
