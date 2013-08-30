class Admin::QuestionsController < ApplicationController
  before_filter :set_question_instance_variable
  before_filter :set_exercise_instance_variable, except:[:show, :up, :down]
  before_filter :build_breadcrumb

  def new
  end

  def create
    @question.exercise = Exercise.find params[:exercise_id]
    ensure_access_rights!
    if @question.save
      flash[:success] = 'Question successfully added'
      redirect_to admin_section_exercise_path(@question.exercise.section, @question.exercise)
    else
      flash[:error] = 'Question could not be created'
      render 'new'
    end
  end

  def show
    ensure_access_rights!
    @question = @question.decorate
  end

  def edit
    ensure_access_rights!
  end

  def update
    @question = Question.find params[:id]
    ensure_access_rights!
    if @question.update app_params
      flash[:success] = 'Successfully updated question'
      redirect_to admin_question_path(@question)
    else
      flash[:error] = 'Could not update question'
      render 'edit'
    end
  end

  def up
    @question.move_higher
    redirect_to admin_section_exercise_path(@question.exercise.section,
                                           @question.exercise)
  end

  def down
    @question.move_lower
    redirect_to admin_section_exercise_path(@question.exercise.section,
                                           @question.exercise)
  end

  private

  def app_params
    params.require(:question).permit(:body, alternatives_attributes:
                                     [:id, :body, :truth_value, :explanation, :_destroy])
  end

  def ensure_access_rights!
    unless QuestionPolicy.user_can_edit?(current_user, @question)
      flash[:error] = 'Unauthorized'
      redirect_to :root
    end
  end

  def set_question_instance_variable
    if params[:id]
      @question = Question.find params[:id]
    elsif params[:question]
      @question = Question.new app_params
    else
      @question = Question.new
    end
  end

  def set_exercise_instance_variable
    if @question.exercise
      @question.exercise
    else
      @exercise = Exercise.find params[:exercise_id]
    end
  end

  def build_breadcrumb
    @exercise ||= @question.exercise
    section = @exercise.section
    course = section.course.decorate
    @breadcrumbs = [
      Breadcrumb.new('My teaching', admin_courses_path),
      Breadcrumb.new("#{course.title}, #{course.decorate.when}", admin_course_path(course)),
      Breadcrumb.new(section.title, admin_course_section_path(course, section)),
      Breadcrumb.new(@exercise.title, admin_section_exercise_path(section, @exercise)),
      Breadcrumb.new("#{@question && 'Question' || 'New question'}")
    ]
  end

end
