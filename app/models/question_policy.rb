class QuestionPolicy
  def self.user_can_edit?(user, question)
    user.id == question.exercise.section.course.user.id
  end
end
