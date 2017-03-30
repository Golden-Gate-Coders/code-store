class CartedProductsController < ApplicationController
  before_action :authenticate_user!

  def create
    product_id = params[:product_id]
    product_quantity = params[:product_quantity]

    @carted_product = CartedProduct.new(
        user_id: current_user.id,
        product_id: product_id,
        quantity: product_quantity,
        status: "carted")

    if @carted_product.save 
      flash[:success] = "Product added to cart."
      redirect_to "/products/#{product_id}"
    else 
      flash[:danger] = "Product couldn't be added to cart."
      redirect_to "/products/#{product_id}"
    end
  end

  def index
    # 1. Using basic active record
    @carted_products = CartedProduct.where(user_id: current_user.id, status: "carted")

    # 2. Using the association
    # @carted_products = current_user.carted_products.where(status: "carted")

    if @carted_products.empty?
      flash[:danger] = "You have nothing in your cart."
      redirect_to "/"
    end
  end

  def destroy
    @carted_product = CartedProduct.find_by(id: params[:id])
    @carted_product.status = "removed"
    @carted_product.save

    # @carted_product.update(status: "removed")

    flash[:success] = "Product removed from cart!"
    redirect_to "/cart"
  end

end
