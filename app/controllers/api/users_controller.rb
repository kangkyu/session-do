module Api
  class UsersController < Api::BaseController
    skip_before_action :authenticate_token, only: [:create]

    def create
      @user = User.new(user_params)
      @user.password_confirmation = user_params[:password]
      if @user.save
        render json: { user_id: @user.id }, status: :created
      else
        render json: { error: 'User not registered' }, status: :unprocessable_entity
      end
    end

    private

    def user_params
      params.require(:user).permit(:username, :email, :password)
    end
  end
end
