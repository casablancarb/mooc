class Admin::CoursesController < ApplicationController
  def index
    @courses = current_user.courses
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new app_params
    @course.user = current_user
    if @course.save
      flash[:success] = 'Course successfully created'
      redirect_to admin_courses_path
    else
      flash[:error] = 'Could not create course'
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def app_params
    params.require(:course).permit(:title, :semester)
  end
end
