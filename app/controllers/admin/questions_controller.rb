class Admin::QuestionsController < ApplicationController
  before_filter :set_exercise_instance_variable

  def new
    @question = Question.new
    build_breadcrumb
  end

  def create
    @question = Question.new app_params
    @question.exercise = Exercise.find params[:exercise_id]
    if QuestionPolicy.user_can_edit?(current_user, @question)
      if @question.save
        flash[:success] = 'Question successfully added'
        redirect_to admin_section_exercise_path(@question.exercise.section, @question.exercise)
      else
        flash[:error] = 'Question could not be created'
        render 'new'
      end
    else
      flash[:error] = 'Unauthorized'
      redirect_to :root
    end
  end

  private

  def app_params
    params.require(:question).permit(:body)
  end

  def set_exercise_instance_variable
    @exercise = Exercise.find params[:exercise_id]
  end

  def build_breadcrumb
    section = @exercise.section
    course = section.course.decorate
    @breadcrumbs = [
      Breadcrumb.new('My teaching', admin_courses_path),
      Breadcrumb.new("#{course.title}, #{course.decorate.when}", admin_course_path(course)),
      Breadcrumb.new(section.title, admin_course_section_path(course, section)),
      Breadcrumb.new(@exercise.title, admin_section_exercise_path(section, @exercise)),
      Breadcrumb.new("#{@question && @question.body && @question.body[0..5] || 'New question'}")
    ]
  end

end
