class ApplicationController < ActionController::Base
  before_action :logged_in_user

  def current_user
    session[:user_id]
  end

  def logged_in_user
    if current_user.present?
      @user = User.find_by(id: current_user)
    end
  end
end
