class CommentsController < ApplicationController
  def create
    @comment = Comment.new app_params
    @exercise = Exercise.find(params[:exercise_id])
    @comment.exercise = @exercise
    @comment.user = current_user
    if current_user.can_read?(@exercise)
      if @comment.save
        flash[:success] = 'Successfully posted comment'
        redirect_to exercise_path(@exercise)
      else
        flash[:error] = 'Could not post comment'
        redirect_to @exercise
      end
    else
      redirect_to :root, status: 401
    end
  end

  private

  def app_params
    params.require(:comment).permit(:body)
  end
end
