class ApplicationController < ActionController::Base
  before_action :require_login, only: [:new, :create, :show]
  helper_method :current_user

  def current_user
    @user ||= User.find_by_id(session[:user_id])
  end

  def require_login
    if current_user.nil?
      redirect_to login_path
    end
  end

end
