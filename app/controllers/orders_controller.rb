class OrdersController < ApplicationController

  def index
    @orders = Order.all
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

    @order.save
    redirect_to order_path(@order)
  end

  def edit

  end

  def show
    @order = Order.find_by_id(params[:id])
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
