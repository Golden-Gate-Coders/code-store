class RemoveProductIdFromOrders < ActiveRecord::Migration[5.0]
  def change
    remove_column :orders, :product_id
  end
end
