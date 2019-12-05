class UsersController < ApplicationController

  def index

  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    redirect_to user_path(@user)
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
