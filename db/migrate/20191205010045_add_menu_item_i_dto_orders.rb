class AddMenuItemIDtoOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :menu_item_id, :integer
  end
end
