class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]

    # if session[:user_id]
    #   @current_user = User.find_by(id: session[:user_id])
    # else
    #   @current_user = false
    # end
  end
  helper_method :current_user

  def authenticate_user!
    redirect_to "/login" unless current_user
  end

  def all_categories
    Category.all
  end
  helper_method :all_categories

end
