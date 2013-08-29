class ExerciseDecorator < BaseDecorator
  def questions
    QuestionDecorator.decorate_collection model.questions
  end
end
