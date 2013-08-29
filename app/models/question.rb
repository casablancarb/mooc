class Question < ActiveRecord::Base
  belongs_to :exercise
  validates_presence_of :body, :exercise_id
end
