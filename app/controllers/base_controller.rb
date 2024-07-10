class BaseController < ApplicationController
  before_action :authenticate_request

  private

  def authenticate_request
    unless current_user
      render json: { error: 'Not Authorized' }, status: :unauthorized
    end
  end
end
