class CourseDecorator < BaseDecorator
  def semester
    if model.semester == 1
      "Spring"
    else
      "Fall"
    end
  end
end
