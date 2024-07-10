class SessionsController < ApplicationController

  def new
    redirect_to tasks_url if current_user
  end

  def create
    user = User.where(email: params[:email]).take
    if user && user.authenticate(params[:password])
      if user.auth_token.nil?
        user.password = params[:password]
        user.regenerate_auth_token
      end
      session[:user_id] = user.id
      redirect_to root_url, notice: "Login successful"
    else
      flash.now.alert = "Please try again!"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_url, notice: "You're now signed out!"
  end
end
