class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def index

  end

  def new
    @user = User.new
  end

  def create

    @user = User.find_by(email: params[:user][:email])

    if @user
      if @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to orders_path
      end
    else
      redirect_to login_path, alert: "User not found. Please try again."
    end
  end

  def edit

  end

  def show
    @user = User.find_by_id(params[:id])
  end

  def update

  end

  # TODO: Flash messaging for success/failure

  def destroy
    session.clear
    redirect_to root_path
  end

  # TODO: Fallback for if login with oAuth is not successfull
  # TODO: Flash messaging for success/failure

  def omniauth
    @user = User.from_omniauth(auth)
    @user.save
    session[:user_id] = @user.id
    puts "You have been successfully logged in with Google"
    redirect_to orders_path
  end

  private

    def auth
      request.env['omniauth.auth']
    end

end
