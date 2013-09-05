class Admin::SectionsController < Admin::AdminController
  before_filter :set_course_variable, except: [:up, :down]
  before_filter :set_section_variable, only: [:edit, :update, :destroy, :show, :up, :down]
  before_filter :make_sure_course_is_writable, except: [:up, :down]
  before_filter :make_sure_section_is_writable, only: [:edit, :update, :destroy, :show, :up, :down]


  def new
    @section = Section.new
    build_breadcrumb
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

  def show
    build_breadcrumb
  end

  def edit
  end

  def update
    @section.course = @course
    if @section.update app_params
      flash[:success] = 'Course section updated'
      redirect_to admin_course_section_path(@course, @section)
    else
      flash[:error] = 'Could not update section'
      render 'edit'
    end
  end

  def destroy
    @section.destroy
    redirect_to admin_course_path(@course)
  end

  def up
    @section.move_higher
    redirect_to admin_course_path(@section.course)
  end

  def down
    @section.move_lower
    redirect_to admin_course_path(@section.course)
  end

  private

  def build_breadcrumb
    @breadcrumbs = [
      Breadcrumb.new('My teaching', admin_courses_path),
      Breadcrumb.new("#{@course.title}, #{@course.decorate.when}", admin_course_path(@course)),
      Breadcrumb.new("#{@section.title || 'Add section'}")]
  end

  def set_course_variable
    @course = Course.find(params[:course_id]).decorate
  end

  def set_section_variable
    @section = Section.find(params[:id]).decorate
  end

  def make_sure_course_is_writable
    redirect_unless_write_access_to_course!(@course)
  end

  def make_sure_section_is_writable
    @section ||= @course.section
    unless @section.course.user.id == current_user.id
      flash[:error] = 'Unauthorized'
      redirect_to admin_courses_path
    end
  end

  def app_params
    params.require(:section).permit(:title, :description)
  end
end
