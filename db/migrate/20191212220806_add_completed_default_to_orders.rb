class AddCompletedDefaultToOrders < ActiveRecord::Migration[5.2]
  def change
    change_column :orders, :completed, :boolean, default: false
  end
end
