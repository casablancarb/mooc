class UsersController < ApplicationController
  skip_before_filter :authorize

  def new
    @user = User.new params[:user]
  end

  def create
    @user = User.new app_params
    @admission_code = params[:admission_code]
    if Admission.code_is_valid?(@admission_code)
      if @user.save 
        if assign_user_to_course(@user, @admission_code)
          flash[:success] = "Successfully registered"
          redirect_to :root
        else
          flash[:error] = "Could not register, please contact your teacher"
          render "new"
        end
      else
        flash[:error] = "Could not register"
        render "new"
      end
    else
      flash[:error] = "Admission code is not valid"
      render "new"
    end
  end

  private

  def assign_user_to_course(user, code)
    AdmissionFactory.assign_user_via_code(user, code)
  end
  
  def app_params
    params.require(:user).permit(:email, :password, :firstname, :lastname, :password_confirmation)
  end
end
