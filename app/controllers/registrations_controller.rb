class RegistrationsController < ApplicationController
  def create
    user = User.find_by(email: user_params[:email].downcase)

    if user.present?

    else
      user = User.create(user_params)
      session[:user_id] = user.id

      flash[:message] = "Welcome! You are now registered!"
      redirect_to root_path
    end
  end

  def new
    @user = User.new
  end

  private
    def user_params
      params.require(:user).permit(:email, :password, :first_name, :last_name)
    end
end
