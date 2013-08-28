class Course < ActiveRecord::Base
  belongs_to :user
  validates_length_of :semester, in: 1..2
  validates_presence_of :user
end
