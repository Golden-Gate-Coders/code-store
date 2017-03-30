class OrdersController < ApplicationController
  before_action :authenticate_user!

  def create
    # 1. Grab all the products in the current user's cart
    @carted_products = CartedProduct.where(user_id: current_user.id, status: "carted")

    # 2. Find the subtotal for all those carted products
    order_subtotal = 0
    @carted_products.each do |carted_product|
      order_subtotal += (carted_product.product.price * carted_product.quantity)
    end

    # 3. Calculate the order's tax
    order_tax = order_subtotal * 0.0875

    # 4. Calculate the order's total
    order_total = order_subtotal + order_tax

    # 5. Save a new order with all the above values
    @order = Order.new(
        user_id: current_user.id,
        subtotal: order_subtotal,
        tax: order_tax,
        total: order_total
      )

    if @order.save
      # 6. Update all carted products to status purchased
      @carted_products.each do |carted_product|
        carted_product.status = "purchased"
        carted_product.order_id = @order.id
        carted_product.save
      end

      flash[:success] = "Order created!"
      redirect_to "/"
    else
      flash[:danger] = "Order could not be completed."
      redirect_to "/cart"
    end
  end

  def show
    @order = Order.find_by(id: params[:id])
  end

end
