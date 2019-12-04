class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.string :name_for_pickup
      t.boolean :completed
      t.integer :total

      t.timestamps
    end
  end
end
