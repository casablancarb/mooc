class AddRatingToFeedback < ActiveRecord::Migration
  def change
    add_column :feedback, :rating, :integer
  end
end
