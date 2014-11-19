class TasksController < ApplicationController
  def index
    @tasks = Task.all.order('done_at asc')
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.create(task_params)
    # @task.save
    redirect_to root_url
  end

  def destroy
    @task = Task.where(id: params[:id]).take
    @task.destroy
    redirect_to root_url
  end

  def refresh
    @task = Task.find(params[:id])
    @task.update(done_at: Time.now)
    redirect_to root_url
  end

  private
  def task_params
    params.require(:task).permit(:name, :comment, :done_at)
  end
end
