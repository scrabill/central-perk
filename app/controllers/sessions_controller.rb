class SessionsController < ApplicationController

  def index

  end

  def new
    @user = User.new
    # @user = User.find_by(email: params[:user][:email])

    # if @user.authenticate(params[:password])
    #   session[:user_id] = @user.id
    #   redirect_to user_path(@user)
    # end
    # @user = User.find_by(email: params[:email])
    #
    # session[:user_id] = @user.id
  end

  def create
    @user = User.find_by(email: params[:user][:email])

    if @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    end

#     @user = User.find_by(name: params["user"]["name"])
# session[:user_id] = @user.id
# redirect_to user_path(@user)

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
    redirect_to root_path
  end

  private

    def auth
      request.env['omniauth.auth']
    end

end
