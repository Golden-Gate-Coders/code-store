class CartedProductsController < ApplicationController

  def create
    product_id = params[:product_id]
    product_quantity = params[:product_quantity]

    @carted_product = CartedProduct.new(
        user_id: current_user.id,
        product_id: product_id,
        quantity: product_quantity,
        status: "carted",
      )

    if @carted_product.save 
      flash[:success] = "Product added to cart"
      redirect_to "/products/#{product_id}"
    else 
      flash[:danger] = "Product couldn't be added to cart."
      redirect_to "/products/#{product_id}"
    end
  end

end
