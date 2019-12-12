class MenuItemsController < ApplicationController

  def index
    @items = MenuItem.all.uniq
  end

  def new
    @item = MenuItem.new
  end

  def create
    @item = MenuItem.create(item_params)

    if @item.save
      redirect_to menu_item_path(@item)
    else
      render :new
    end
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
