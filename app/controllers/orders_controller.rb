class OrdersController < ApplicationController

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
    @order = Order.find_by_id(params[:id])
  end

  def show
    @order = Order.find_by_id(params[:id])
  end

  def update
    @order = Order.find_by_id(params[:id])
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

  def order_params
    ActiveRecord::Type::Boolean.new.cast(params[:order][:completed])
    params.require(:order).permit(:user_id, :name_for_pickup, :completed, :total, :menu_item_ids)
  end

  def items_to_add(order_params)
    items_to_add = params[:order][:menu_item_ids]

    items_to_add.each do |item_id|
      if item_id != ""
        item_id = item_id.to_i
        item_to_add = MenuItem.find_by_id(item_id)
        @order.menu_items << item_to_add
      end
    end
  end

end
