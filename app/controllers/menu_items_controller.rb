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
    @item = MenuItem.find_by_id(params[:id])
  end

  def show
    @item = MenuItem.find_by_id(params[:id])
  end

  def update
    @item = MenuItem.find_by_id(params[:id])
    @item.update(item_params)
    if @item.save
      redirect_to menu_item_path(@item)
    else
      render :edit
    end
  end

  def destroy

  end

  private

  def item_params
    params[:menu_item][:price] = params[:menu_item][:price].to_f
    params.require(:menu_item).permit(:name, :description, :price)
  end


end
