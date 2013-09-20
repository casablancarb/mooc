class ExercisesController < ApplicationController
  def show
    @exercise = Exercise.find_published(params[:id]).decorate
    @comment = Comment.new

    if ExercisePolicy.user_can_read?(current_user, @exercise)
      @breadcrumbs = [
        Breadcrumb.new('My studies', studies_path),
        Breadcrumb.new(@exercise.section.course.title, course_path(@exercise.section.course)),
        Breadcrumb.new(@exercise.section.title, section_path(@exercise.section)),
        Breadcrumb.new(@exercise.title)
      ]
    else
      redirect_to :root, status: 401
    end
  end
end
