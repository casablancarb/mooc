class User < ActiveRecord::Base
  has_secure_password
  has_many :courses
  has_many :admissions
  validates_presence_of :email, :firstname, :lastname
  validates_presence_of :password, on: :create
  validates_length_of :password, minimum: 6, allow_blank: true
  validates_format_of :email, with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/

  attr_accessor :current_password

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

  def is_published?
    published
  end

  def is_teacher?
    is_teacher
  end

  def can_read?(object)
    if object.respond_to?(:is_readable_by?)
      object.is_readable_by? self
    else
      false
    end
  end
end
