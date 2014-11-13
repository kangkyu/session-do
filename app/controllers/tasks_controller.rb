class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.create(task_params)
    # @task.save
    redirect_to root_url
  end

  private
  def task_params
    params.require(:task).permit(:name, :comment, :done_at)
  end
end
