class SectionDecorator < BaseDecorator
  def course
    model.course.decorate
  end

  def exercises
    model.exercises.decorate
  end

  def progress_class
    ProgressCalculator.progress_to_class progress
  end

  def progress
    ProgressCalculator.calculateProgress(exercises)
  end
end
