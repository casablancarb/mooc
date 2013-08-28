class User < ActiveRecord::Base
  has_secure_password
  has_many :courses
  validates_presence_of :email, :password, :firstname, :lastname

  def can_edit_course? course
    CourseEditPolicy.user_can_edit_course? course, user
  end

  def owner_is? other_user
    user.id == other_user.id
  end
end
