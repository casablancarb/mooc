class FeedbackController < ApplicationController
  def new
    @exercise = Exercise.find params[:exercise_id]
    unless current_user.can_read? @exercise
      flash[:error] = 'Unauthorized'
      redirect_to :root
    end
    @feedback = Feedback.new
  end

  def create
    @exercise = Exercise.find params[:exercise_id]
    if current_user.can_read? @exercise
      @feedback = Feedback.new app_params
      @feedback.exercise_id = @exercise.id
      if @feedback.save
        flash[:success] = 'Feedback sent, thank you :)'
        redirect_to @exercise
      else
        flash[:error] = 'Could not send feedback'
        render 'new'
      end
    else
      flash[:error] = 'Unauthorized'
      redirect_to :root
    end
  end

  private

  def app_params
    params.require(:feedback).permit(:body, :rating, :exercise_id)
  end
end
