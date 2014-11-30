class UsersController < ApplicationController

  def show
    @user = User.where(params[:id]).take
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.password_confirmation = @user.password
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end