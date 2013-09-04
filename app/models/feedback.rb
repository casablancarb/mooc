class Feedback < ActiveRecord::Base
  validates_presence_of :exercise_id, :body, :rating
end
