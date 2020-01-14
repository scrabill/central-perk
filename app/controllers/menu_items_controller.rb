class MenuItemsController < ApplicationController
  before_action :find_item, only:[:edit, :show, :update]

  def index
    Order.most_popular
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
  end

  def update
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

  def find_item
    @item = MenuItem.find_by_id(params[:id])
  end

  def item_params
    params[:menu_item][:price] = params[:menu_item][:price].to_f
    params.require(:menu_item).permit(:name, :description, :price)
  end

end
