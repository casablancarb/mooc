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
    return 0 if sections.length < 1
    progress = 0
    total = sections.length * 100
    sections.each do |s|
      progress += s.progress
    end
    (progress.to_f / total * 100).to_i
  end
end
