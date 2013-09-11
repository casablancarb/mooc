class Admin::AnnouncementsController < Admin::AdminController
  def new
    @announcement = Announcement.new
    @course = Course.find params[:course_id]
  end

  def create
    @course = Course.find params[:course_id]
    @announcement = Announcement.new app_params
    @announcement.course = @course
    if @announcement.save
      flash[:success] = 'Announcement successfully posted'
      redirect_to admin_course_path(@course)
    else
      flash[:error] = 'Could not create announcement'
      render :new
    end
  end

  private

  def app_params
    params.require(:announcement).permit(:title, :body)
  end
end
