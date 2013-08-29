class CoursesController < ApplicationController
  def index
    @courses = CourseDecorator.decorate_collection Course.all
  end

  def show
  end
end
