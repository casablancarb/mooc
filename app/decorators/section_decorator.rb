class SectionDecorator < BaseDecorator
  def course
    model.course.decorate
  end
end
