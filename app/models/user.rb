class User < ActiveRecord::Base
  has_secure_password
  has_many :courses
  validates_presence_of :email, :password, :firstname, :lastname

  def can_edit_course? course
    CourseEditPolicy.user_can_edit_course? self, course
  end
end
