class SessionsController < ApplicationController
  before_action :require_login, only: [:destroy]

  def new
    redirect_to tasks_url if current_user
  end

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: "Login successful"
    else
      flash.now.alert = "Invalid email or password"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_url, notice: "You're now signed out!"
  end
end
