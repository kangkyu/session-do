class VisitsController < ApplicationController
  around_action :visit_and_task

  def update
    @visit.update(visit_params)
  end

  def destroy
    @visit.destroy
  end

private

  def visit_and_task
    @visit = Visit.find(params[:id])
    yield
    redirect_to task_url(Task.find(params[:task_id]))
  end

  def visit_params
    params.require(:visit).permit(:note).merge {user_id: session[:user_id], task_id: params[:task_id]}
  end
end
