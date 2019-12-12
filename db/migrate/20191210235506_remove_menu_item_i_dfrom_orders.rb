class RemoveMenuItemIDfromOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :menu_item_id
  end
end
