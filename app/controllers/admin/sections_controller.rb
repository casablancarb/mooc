class Admin::SectionsController < ApplicationController
  before_filter :set_course_variable
  before_filter :make_sure_course_is_writable
  before_filter :set_section_variable, only: [:edit, :update, :destroy]
  before_filter :make_sure_section_is_writable, only: [:edit, :update, :destroy]

  def new
    @section = Section.new
  end

  def create
    @section = Section.new app_params
    @section.course = @course
    if @section.save
      flash[:success] = 'Course section added'
      redirect_to admin_course_path(@course)
    else
      flash[:error] = 'Could not create course section'
      render 'new'
    end
  end

  def edit
  end

  def update
    @section.course = @course
    if @section.update app_params
      flash[:success] = 'Course section updated'
      redirect_to admin_course_path(@course)
    else
      flash[:error] = 'Could not update section'
      render 'edit'
    end
  end

  def destroy
    @section.destroy
    redirect_to admin_course_path(@course)
  end

  private

  def set_course_variable
    @course = Course.find(params[:course_id]).decorate
  end

  def set_section_variable
    @section = Section.find(params[:id])
  end

  def make_sure_course_is_writable
    redirect_unless_write_access_to_course!(@course)
  end

  def make_sure_section_is_writable
    unless @section.course.user.id == current_user.id
      flash[:error] = 'Unauthorized'
      redirect_to admin_courses_path
    end
  end

  def app_params
    params.require(:section).permit(:title, :description)
  end
end
