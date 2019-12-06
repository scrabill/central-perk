class MenuItemsController < ApplicationController

  def index

  end

  def new
    @item = MenuItem.new
  end

  def create
    @item = MenuItem.create(item_params)
    redirect_to menu_item_path(@item)
  end

  def edit

  end

  def show
    @item = MenuItem.find_by_id(params[:id])
  end

  def update

  end

  def destroy

  end

  private

  def item_params
    params.require(:menu_item).permit(:name, :description, :price)
  end


end
