class VisitsController < ApplicationController

  def update
    @visit = Visit.find(params[:id])
    @visit.update({user_id: session[:user_id], task_id: params[:task_id]}.merge params.require(:visit).permit(:note))
    redirect_to task_url(Task.find(params[:task_id]))
  end

  def destroy
    @visit = Visit.find(params[:id])
    @visit.destroy
    redirect_to task_url(Task.find(params[:task_id]))
  end
end
