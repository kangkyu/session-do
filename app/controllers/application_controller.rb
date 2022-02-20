class ApplicationController < ActionController::Base

  private

  def require_login
    unless current_user
      redirect_to login_url, alert: "Please log in or sign up"
    end
  end

  def current_user
    begin
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue
      nil
    end
  end

  helper_method :current_user

end
