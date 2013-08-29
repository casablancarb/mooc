class Question < ActiveRecord::Base
  belongs_to :exercise
  has_many :alternatives
  validates_presence_of :body, :exercise_id
end
