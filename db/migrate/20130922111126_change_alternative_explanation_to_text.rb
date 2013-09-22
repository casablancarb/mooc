class ChangeAlternativeExplanationToText < ActiveRecord::Migration
  def change
    change_column :alternatives, :explanation, :text
  end
end
