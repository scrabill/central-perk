class ChangePriceTypeToFloat < ActiveRecord::Migration[5.2]
  def change
    change_column :menu_items, :price, :float
  end
end
