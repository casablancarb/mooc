class AdmissionsController < ApplicationController
  def new
    @course = Course.find(params[:id]).decorate
  end

  def create
    @course = Course.find(params[:id]).decorate
    
    if @course.admission_code == params[:admission_code]
      admission = Admission.new(user: current_user, course_id: @course.id)
      if admission.save
        flash[:success] = 'Successfully joined course'
        redirect_to @course
      else
        flash[:error] = 'Could not join course, please contact your teacher'
        render 'new'
      end
    else
      flash[:error] = 'Incorrect code'
      render 'new'
    end
  end
end
