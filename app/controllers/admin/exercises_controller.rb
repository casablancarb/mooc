class Admin::ExercisesController < ApplicationController
  before_filter :set_section_instance_variable

  def new
    @exercise = Exercise.new
  end

  def create
    @exercise = Exercise.new app_params
    @exercise.section = Section.find(params[:section_id])
    if ExercisePolicy.user_can_edit?(current_user, @exercise)
      if @exercise.save
        flash[:success] = 'Successfully added exercise'
        redirect_to admin_course_section_path(@section.course, @section)
      else
        flash[:error] = 'Could not add exercise'
        render 'new'
      end
    else
      flash[:error] = 'Unauthorized'
      redirect_to :root
    end
  end

  def edit
    @exercise = Exercise.find params[:id]
    unless ExercisePolicy.user_can_edit?(current_user, @exercise)
      flash[:error] = 'Unauthorized'
      redirect_to :root
    end
  end

  def update
    @exercise = Exercise.find params[:id]
    if ExercisePolicy.user_can_edit?(current_user, @exercise)
      if @exercise.update app_params
        flash[:success] = 'Successfully updated exercise'
        redirect_to admin_course_section_path(@section.course, @section)
      else
        flash[:error] = 'Could not update exercise'
        render 'new'
      end
    else
      flash[:error] = 'Unauthorized'
      redirect_to :root
    end
  end

  def destroy
    @exercise = Exercise.find params[:id]
    if ExercisePolicy.user_can_edit?(current_user, @exercise)
      @exercise.destroy
      flash[:success] = 'Successfully removed exercise'
    else
      flash[:error] = 'Could not add exercise'
    end
    redirect_to admin_course_section_path(@section.course, @section)
  end

  private

  def set_section_instance_variable
    @section = Section.find(params[:section_id]).decorate
  end

  def app_params
    params.require(:exercise).permit(:title, :description, :video_id)
  end
end