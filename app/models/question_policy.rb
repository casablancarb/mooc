class QuestionPolicy
  def self.user_can_edit?(user, question)
    user.id == question.exercise.section.course.user.id
  end

  def self.user_can_read?(user, question)
    Question.available_to_user(user).include?(question)
  end
end
