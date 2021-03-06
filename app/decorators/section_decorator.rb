class SectionDecorator < BaseDecorator
  def course
    model.course.decorate
  end

  def exercises
    model.published_exercises.decorate
  end

  def all_exercises
    model.exercises.decorate
  end

  def progress_class
    ProgressCalculator.progress_to_class progress
  end

  def progress
    model.progress_for_user(current_user)
  end

  def has_questions?
    exercises.each do |e|
      return true if e.questions.length > 0
    end
    false
  end
end
