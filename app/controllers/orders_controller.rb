class OrdersController < ApplicationController
  before_action :find_order, only: [:edit, :show, :update]

  def index
    if params[:user_id]
      @orders = Order.where(user_id: params[:user_id])
    else
      @orders = Order.all
    end
  end

  # TODO: Filtered by completed and reuse index view
  def completed
    @orders = Order.completed
  end

  def new
    @order = Order.new
  end

  # TODO: Clean the heck out of this...

  def create
    @order = Order.create(order_params)

    items_to_add(order_params)

    # Can user @order since .create already saves it
    if @order.save
      redirect_to order_path(@order)
    else
      render :new
    end

  end

  def edit
  end

  def show
  end

  def update
    @order.menu_items.clear
    @order.update(order_params)

    items_to_add(order_params)

    if @order.save
      redirect_to order_path(@order)
    else
      render :edit
    end
  end

  def destroy

  end

  private

  def find_order
    @order = Order.find_by_id(params[:id])
  end

  def order_params
    params.require(:order).permit(:user_id, :name_for_pickup, :completed, :total, :menu_item_ids)
  end

  def items_to_add(order_params)
    params[:order][:menu_item_ids].each do |item_id|
      if item_id != ""
        @order.menu_items << MenuItem.find_by_id(item_id)
      end
    end
  end

end
