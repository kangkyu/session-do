class VisitsController < ApplicationController

  def destroy
    @visit = Visit.find(params[:id])
    @visit.destroy
    redirect_to task_url(params[:task_id]) and return
  end

private

  def visit_params
    params.require(:visit).permit(:note, :task_id).merge(:user_id => session[:user_id])
  end
end
