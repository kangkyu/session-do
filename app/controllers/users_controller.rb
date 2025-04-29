class UsersController < ApplicationController
  before_action :require_login, only: [:edit, :update]
  before_action :require_logout, only: [:new, :create]

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to root_url, notice: "Update successful"
    else
      flash.now.alert = "Please try again!"
      render :edit, status: :unprocessable_entity
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.password_confirmation = user_params[:password]
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url
      flash[:notice] = "Registration successful"
    else
      flash.now.alert = "Please try again!"
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
