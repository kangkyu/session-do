class TasksController < ApplicationController
  def index
    @tasks = Task.sorted
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
    @task.update(done_at: Time.now.in_time_zone)
    redirect_to root_url
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to root_url
  end

  private
  def task_params
    params.require(:task).permit(:name, :comment, :done_at)
  end
end
