class UsersController < ApplicationController

  def new
  end

  def create
    @user = User.new(name: params[:user_name],
                        email: params[:user_email],
                        admin: false,
                        password: params[:user_password],
                        password_confirmation: params[:user_password_confirmation])

    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "You have successfully signed up!"
      redirect_to "/"
    else
      flash[:warning] = "Invalid email or password"
      redirect_to "/signup"
    end
  end

end
