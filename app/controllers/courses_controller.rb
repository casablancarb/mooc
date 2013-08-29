class CoursesController < ApplicationController
  def index
    @courses = CourseDecorator.decorate_collection Course.all
  end

  def show
    @course = Course.find(params[:id]).decorate
    unless current_user.takes_course? @course
      flash[:error] = 'You are not admitted to this course, please join it first'
      redirect_to courses_path
    end
  end
end
