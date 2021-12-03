class UsersController < ApplicationController
  def login
    @user = User.find_by(email: params[:email], password: params[:password])

    if @user.present?
      session[:user_id] = @user.id

      flash[:message] = "Welcome! You are now signed in!"
      redirect_to posts_path
    else
      flash[:message] = "User account not found"
    end
  end

  def register
    user = User.find_by(email: params[:email].downcase)

    if user.present?

    else
      user = User.create(user_params)
      session[:user_id] = user.id

      flash[:message] = "Welcome! You are now registered!"
      redirect_to posts_path
    end
  end

  def logout
    session[:user_id] = nil

    flash[:message] = "You are now signed out!"
    redirect_to posts_path
  end

  private
    def user_params
      params.require(:post).permit(:email, :password, :first_name, :last_name)
    end
end
