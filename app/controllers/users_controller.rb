class UsersController < ApplicationController
  skip_before_filter :authorize

  def new
    @user = User.new params[:user]
  end

  def create
    @user = User.new app_params
    if @user.save
      flash[:success] = "Successfully registered"
      redirect_to :root
    else
      flash[:error] = "Could not register"
      render "new"
    end
  end

  private
  
  def app_params
    params.require(:user).permit(:email, :password, :firstname, :lastname, :password_confirmation)
  end
end
