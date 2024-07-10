class SessionsController < ApplicationController
  before_action :require_login, only: [:destroy]

  def new
    redirect_to tasks_url if current_user
  end

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      if user.auth_token.nil?
        user.regenerate_auth_token
      end

      respond_to do |format|
        format.html do
          session[:user_id] = user.id
          redirect_to root_url, notice: "Login successful"
        end
        format.json { render json: { token: user.auth_token, user_id: user.id }, status: :ok }
      end
    else
      respond_to do |format|
        format.html do
          flash.now.alert = "Invalid email or password"
          render :new, status: :unprocessable_entity
        end
        format.json { render json: { error: 'Invalid credentials' }, status: :unauthorized }
      end
    end
  end

  def destroy
    if current_user && current_user.auth_token
      current_user.regenerate_auth_token
    end

    respond_to do |format|
      format.html do
        session[:user_id] = nil
        redirect_to login_url, notice: "You're now signed out!"
      end
      format.json { head :no_content }
    end
  end
end
