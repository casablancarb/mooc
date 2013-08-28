class CourseEditPolicy
  def self.user_can_edit_course?(user, course)
    course.owned_by? user
  end
end
