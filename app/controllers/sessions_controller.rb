class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:user_email])

    if user && user.authenticate(params[:user_password])
      session[:user_id] = user.id
      flash[:success] = "Successfully logged in!"
      redirect_to "/"
    else
      # User was not found
      # Go back to the login page
      flash[:danger] = "Email or Password is invalid"
      redirect_to "/login"
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You have been logged out!"
    redirect_to "/"
  end
  
end
