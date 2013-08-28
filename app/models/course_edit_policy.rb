class CourseEditPolicy
  def user_can_edit_course? user, course
    course.owner_is? user
  end
end
