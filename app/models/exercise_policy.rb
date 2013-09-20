class ExercisePolicy
  def self.user_can_edit?(user, exercise)
    user.id == exercise.section.course.user.id
  end

  def self.user_can_read?(user, exercise)
    return true if user.is_teacher?
    exercise.is_published? && user.takes_course?(exercise.course)
  end

  private
end
