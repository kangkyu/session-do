class VisitsController < ApplicationController
  # def create
  #   @visit = Visit.new({user_id: session[:user_id], task_id: params[:task_id]}.merge params.require(:visit).permit(:note))
  #   @visit.save
  #   redirect_to task_url(Task.find(params[:task_id]))
  # end
  def update
    @visit = Visit.find(params[:id])
    @visit.update({user_id: session[:user_id], task_id: params[:task_id]}.merge params.require(:visit).permit(:note))
    redirect_to task_url(Task.find(params[:task_id]))
  end
end
