class Course < ActiveRecord::Base
  validates_length_of :semester, in: 1..2
end
