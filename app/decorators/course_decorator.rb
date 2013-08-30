class CourseDecorator < BaseDecorator
  def sections
    SectionDecorator.decorate_collection model.sections
  end

  def semester
    if model.semester == 1
      "Spring"
    else
      "Fall"
    end
  end

  def summary
    "#{title} - #{self.when}"
  end

  def when
    "#{year} #{semester}"
  end

  def progress_class
    ProgressCalculator.progress_to_class progress
  end

  def progress
    ProgressCalculator.calculateProgress(sections)
  end
end
