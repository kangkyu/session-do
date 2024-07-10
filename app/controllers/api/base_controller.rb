module Api
  class BaseController < ActionController::API
    before_action :authenticate_token

    private

    def authenticate_token
      token = request.headers['Authorization']&.split(' ')&.last
      @current_user = User.find_by(auth_token: token)
      render json: { error: 'Not Authorized' }, status: :unauthorized unless @current_user
    end

    def current_user
      @current_user
    end
  end
end
