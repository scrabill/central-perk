class ApplicationController < ActionController::Base
  helper_method :current_user

  # Will this account for if it is unable to find a current user (no one is logged in)?
  def current_user
    @user ||= User.find_by_id(session[:user_id])
  end
  
end
