class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
  before_filter :authorize

  private

  def redirect_unless_write_access_to_course!(course)
    unless CourseEditPolicy.user_can_edit_course?(current_user, course)
      flash[:error] = "Unauthorized"
      redirect_to admin_courses_path
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authorize
    if current_user.nil?
      flash[:error] = "You are not logged in"
      redirect_to login_url
    end
  end
end
