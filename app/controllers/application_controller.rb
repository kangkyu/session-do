class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def require_login
    unless current_user
      redirect_to register_url, alert: "Please log in or sign up"
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

  # def either_tasks_url(task)
  #   if task.is_daily
  #     daily_tasks_url
  #   else
  #     tasks_url
  #   end
  # end
end
