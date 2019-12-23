class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def index

  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)

    if @user.save
      redirect_to orders_path
    else
      render :new
    end
  end

  def edit

  end

  def show
    @user = User.find_by_id(params[:id])
  end

  def update

  end

  def destroy

  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password)
    end

end
