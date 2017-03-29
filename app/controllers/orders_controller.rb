class OrdersController < ApplicationController

  def create
    quantity = params[:product_quantity]

    product_id = params[:product_id]
    product = Product.find_by(id: product_id)
    product.stock = product.stock - quantity.to_i
    product.save

    @order = Order.new(quantity: quantity, product_id: product_id, user_id: current_user.id)

    @order.calculate_subtotal(product.price, quantity.to_i)
    @order.calculate_tax
    @order.calculate_total

    @order.save
    redirect_to "/orders/#{@order.id}"
  end

  def show
    @order = Order.find_by(id: params[:id])
  end

end
