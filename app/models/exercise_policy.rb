class ExercisePolicy
  def self.user_can_edit?(user, exercise)
    user.id == exercise.section.course.user.id
  end
end
