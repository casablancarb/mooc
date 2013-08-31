class AddTimestampsToEverything < ActiveRecord::Migration
  def change
    add_column(:users, :created_at, :datetime)
    add_column(:users, :updated_at, :datetime)
    add_column(:admissions, :created_at, :datetime)
    add_column(:admissions, :updated_at, :datetime)
    add_column(:alternatives, :created_at, :datetime)
    add_column(:alternatives, :updated_at, :datetime)
    add_column(:courses, :created_at, :datetime)
    add_column(:courses, :updated_at, :datetime)
    add_column(:exercises, :created_at, :datetime)
    add_column(:exercises, :updated_at, :datetime)
    add_column(:answers, :created_at, :datetime)
    add_column(:answers, :updated_at, :datetime)
    add_column(:questions, :created_at, :datetime)
    add_column(:questions, :updated_at, :datetime)
    add_column(:sections, :created_at, :datetime)
    add_column(:sections, :updated_at, :datetime)
  end
end
