class TasksController < ApplicationController
  before_action :require_login

  def index
    @tasks = Task.reverse
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to root_url
    else
      render :new
    end
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
    if @task.update(task_params)
      redirect_to root_url
    else
      render :edit
    end
  end

  private
  def task_params
    params.require(:task).permit(:name, :comment, :done_at)
  end
end
