class AnswersController < ApplicationController
  def create
    @question = Question.find params[:id]
    make_sure_question_is_readable!
    if params.has_key?(:answer)
      answer = Answer.new app_params
      if answer.save
        render json: answer.alternative.to_json
      else
        flash[:error] = 'An error occured please contact your teacher'
        redirect_to exercise_path(answer.question.exercise)
      end
    else
      render json: {}
    end
  end

  private

  def app_params
    params.require(:answer).permit(:alternative_id)
  end

  def make_sure_question_is_readable!
    unless current_user.can_read?(@question)
      flash[:error] = 'Unauthorized'
      redirect_to :root
    end
  end
end
