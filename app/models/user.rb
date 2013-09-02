class User < ActiveRecord::Base
  has_secure_password
  has_many :courses
  has_many :admissions
  validates_presence_of :email, :password, :firstname, :lastname
  validates_length_of :password, minimum: 6

  def admitted_courses
    admissions.map(&:course).uniq
  end

  def takes_course?(course)
    admitted_courses.include?(course)
  end

  def can_edit_course? course
    CourseEditPolicy.user_can_edit_course? self, course
  end

  def courses_admitted_to
    admissions.joins(:courses)
  end

  def thinks_alternative_is_correct?(alternative)
    alternative.is_selected_by_user? self
  end

  def is_teacher?
    is_teacher
  end
end
