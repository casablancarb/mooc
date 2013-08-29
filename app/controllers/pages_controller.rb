class PagesController < ApplicationController
  def studies
    @courses = CourseDecorator.decorate_collection current_user.admitted_courses
  end
end
