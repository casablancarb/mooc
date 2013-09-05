class Admin::ExercisesController < Admin::AdminController
  before_filter :set_section_instance_variable, except: [:up, :down]

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

  def show
    @exercise = Exercise.find(params[:id]).decorate
    unless ExercisePolicy.user_can_edit?(current_user, @exercise)
      flash[:error] = 'Unauthorized'
      redirect_to :root
    end
    build_breadcrumb
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
        redirect_to admin_section_exercise_path(@section, @exercise)
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
      flash[:error] = 'Unauthorized'
      redirect_to :root
    end
    redirect_to admin_course_section_path(@section.course, @section)
  end

  def up
    @exercise = Exercise.find params[:id]
    if ExercisePolicy.user_can_edit?(current_user, @exercise)
      @exercise.move_higher
      redirect_to admin_course_section_path(@exercise.section.course, @exercise.section)
    else
      flash[:error] = 'Unauthorized'
      redirect_to :root
    end
  end

  def down
    @exercise = Exercise.find params[:id]
    if ExercisePolicy.user_can_edit?(current_user, @exercise)
      @exercise.move_lower
      redirect_to admin_course_section_path(@exercise.section.course, @exercise.section)
    else
      flash[:error] = 'Unauthorized'
      redirect_to :root
    end
  end

  private

  def build_breadcrumb
    course = @section.course.decorate
    @breadcrumbs = [
      Breadcrumb.new('My teaching', admin_courses_path),
      Breadcrumb.new("#{course.title}, #{course.decorate.when}", admin_course_path(course)),
      Breadcrumb.new(@section.title, admin_course_section_path(course, @section)),
      Breadcrumb.new(@exercise.title)]
  end

  def set_section_instance_variable
    @section = Section.find(params[:section_id]).decorate
  end

  def app_params
    params.require(:exercise).permit(:title, :description, :video_id, :published)
  end
end
