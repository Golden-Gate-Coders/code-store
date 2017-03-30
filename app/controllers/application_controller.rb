class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :all_categories, :shopping_cart_count

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]

    # if session[:user_id]
    #   @current_user = User.find_by(id: session[:user_id])
    # else
    #   @current_user = false
    # end
  end

  def authenticate_user!
    redirect_to "/login" unless current_user
  end

  def all_categories
    Category.all
  end

  def shopping_cart_count
    if current_user
      current_user.carted_products.where(status: "carted").length
    end
  end


end
