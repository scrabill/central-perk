class SessionsController < ApplicationController

  def index

  end

  def create

  end

  def new

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

end
