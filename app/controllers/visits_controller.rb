class VisitsController < ApplicationController
  before_action :find_visit

  def update
    @visit.update({user_id: session[:user_id], task_id: params[:task_id]}.merge params.require(:visit).permit(:note))
    redirect_to task_url(Task.find(params[:task_id]))
  end

  def destroy
    @visit.destroy
    redirect_to task_url(Task.find(params[:task_id]))
  end

  def find_visit
    @visit = Visit.find(params[:id])
  end
end
