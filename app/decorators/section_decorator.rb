class SectionDecorator < BaseDecorator
  def course
    model.course.decorate
  end

  def progress_class
    ProgressCalculator.progress_to_class progress
  end

  def progress
    fake_progress
  end

  private

  def fake_progress
    22
  end
end
