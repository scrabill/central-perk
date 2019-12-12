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
    # Should this be user.order.build instead?
    @order = Order.create(order_params)

    items_to_add = params[:order][:menu_item_ids]

    items_to_add.each do |item_id|
      if item_id != ""
        item_id = item_id.to_i
        item_to_add = MenuItem.find_by_id(item_id)
        # binding.pry
        @order.menu_items << item_to_add
      end
    end

    if @order.save
      redirect_to order_path(@order)
    else
      render :new
    end

  end

  def edit

  end

  def show
    if params[:id] == "completed"
      puts "please work"
    else
      @order = Order.find_by_id(params[:id])
    end
  end

  def update

  end

  def destroy

  end

  private

  # params "order"=>{"user_id"=>"2", "name_for_pickup"=>"Shannon", "menu_item_id"=>["", "2"]}, "commit"=>"Create Order"}
  # When do we need an attribute accessor?

  def order_params
    params.require(:order).permit(:user_id, :name_for_pickup, :completed, :total, :menu_item_ids)
  end

end
