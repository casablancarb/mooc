class Admin::CoursesController < Admin::AdminController
  def index
    @courses = current_user.courses
  end

  def show
    @course = Course.find(params[:id]).decorate
    @user = current_user
    redirect_unless_write_access_to_course! @course
    build_breadcrumb
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new app_params
    @course.user = current_user
    if @course.save
      flash[:success] = 'Course successfully created'
      redirect_to admin_courses_path
    else
      flash[:error] = 'Could not create course'
      render 'new'
    end
  end

  def edit
    @course = Course.find params[:id]
    redirect_unless_write_access_to_course! @course
    build_breadcrumb
  end

  def update
    @course = Course.find params[:id]
    redirect_unless_write_access_to_course! @course
    if @course.update app_params
      flash[:notice] = 'Course successfully edited'
      redirect_to admin_courses_path
    else
      flash[:error] = 'Could not create course'
      render 'edit'
    end
  end

  def destroy
    course = Course.find params[:id]
    redirect_unless_write_access_to_course! @course
    if course.delete
      flash[:notice] = 'Successfully deleted course'
      redirect_to admin_courses_path
    else
      flash[:error] = 'Could not delete course'
      redirect_to admin_courses_path
    end
  end

  private

  def build_breadcrumb
    @breadcrumbs = [
      Breadcrumb.new('My teaching', admin_courses_path),
      Breadcrumb.new(@course.title + ', ' + @course.decorate.when)]
  end

  def app_params
    params.require(:course).permit(:title, :semester, :year, :admission_code)
  end
end
