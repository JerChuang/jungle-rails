class UsersController < ApplicationController

  def new
  end

  def create
    user = User.create(user_params)
    if user = User.authenticate_with_credentials(user_params[:email], user_params[:password])
      session[:user_id] = user.id
      flash[:success] = "Successfully Created User!"
      redirect_to '/'
    else
      flash[:warning] = "Invalid Email or Password"
      redirect_to '/signup'
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end
