class CourseDecorator < BaseDecorator
  def semester
    if model.semester == 1
      "Spring"
    else
      "Fall"
    end
  end

  def when
    "#{year} #{semester}"
  end

  def progress_class
    if progress < 25
      "danger"
    elsif progress < 50
      "warning"
    elsif progress < 75
      "info"
    elsif progress <= 100
      "success"
    end
  end

  def progress
    fake_progress #TODO!!
  end

  private

  def fake_progress
    30 #TODO!!!
  end
end
