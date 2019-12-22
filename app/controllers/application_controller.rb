class ApplicationController < ActionController::Base
  before_action :require_login, only: [:new, :create, :show, :index]
  helper_method :current_user, :logged_in?

  def current_user
    @user ||= User.find_by_id(session[:user_id])
  end

  def require_login
    if current_user.nil?
      redirect_to login_path
    end
  end

  def logged_in?
    session[:user_id] ? true : false
  end

end
