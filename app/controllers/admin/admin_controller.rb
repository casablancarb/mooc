class Admin::AdminController < ApplicationController
  before_filter :authorize_teacher

  private

  def authorize_teacher
    unless current_user && current_user.is_teacher?
      flash[:error] = "You do not have permission to access this page"
      redirect_to :root
    end
  end
end
