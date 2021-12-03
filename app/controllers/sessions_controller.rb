class SessionsController < ApplicationController
  def new
    if !current_user.nil?
      flash[:message] = "You are already signed in!"
      redirect_to root_path
    end
  end

  def create
    @user = User.find_by(email: user_params[:email], password: user_params[:password])

    if @user.present?
      session[:user_id] = @user.id

      flash[:message] = "Welcome! You are now signed in!"
      redirect_to root_path
    else
      flash[:message] = "User account not found"
      redirect_to new_session_path
    end
  end

  def logout
    session[:user_id] = nil

    flash[:message] = "You are now signed out!"
    redirect_to root_path
  end

  private
    def user_params
      params.require(:user).permit(:email, :password)
    end
end
