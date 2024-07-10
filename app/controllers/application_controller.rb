class ApplicationController < ActionController::Base

  private

  def require_login
    unless current_user
      redirect_to login_url, alert: "Please log in or sign up"
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  rescue ActiveRecord::RecordNotFound
    nil
  end

  helper_method :current_user
end
