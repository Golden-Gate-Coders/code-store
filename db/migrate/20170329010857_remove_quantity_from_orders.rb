class RemoveQuantityFromOrders < ActiveRecord::Migration[5.0]
  def change
    remove_column :orders, :quantity
  end
end
