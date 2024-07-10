module Api
  class SessionsController < Api::BaseController
    skip_before_action :authenticate_token, only: [:create]

    def create
      user = User.find_by(email: params[:email])
      if user&.authenticate(params[:password])
        user.regenerate_auth_token if user.auth_token.nil?
        render json: { token: user.auth_token, user_id: user.id }, status: :ok
      else
        render json: { error: 'Invalid credentials' }, status: :unauthorized
      end
    end

    def destroy
      if current_user
        current_user.regenerate_auth_token
        head :no_content
      else
        render json: { error: 'Unauthorized' }, status: :unauthorized
      end
    end
  end
end
