class ApplicationController < ActionController::Base

  private

  def require_login
    unless current_user
      respond_to do |format|
        format.html { redirect_to login_url, alert: "Please log in or sign up" }
        format.json { render json: { error: 'Authentication required' }, status: :unauthorized }
      end
    end
  end

  def current_user
    @current_user ||= begin
      if session[:user_id]
        find_user_by_session
      elsif request.format.json?
        find_user_by_token
      end
    end
  end

  def find_user_by_session
    User.find_by(id: session[:user_id])
  rescue ActiveRecord::RecordNotFound
    nil
  end

  def find_user_by_token
    token = extract_auth_token_from_header
    User.find_by(auth_token: token) if token
  end

  def extract_auth_token_from_header
    auth_header = request.headers['Authorization']
    auth_header.split(' ').last if auth_header.present? && auth_header.start_with?('Bearer ')
  end

  helper_method :current_user
end
