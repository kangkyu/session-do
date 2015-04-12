class TasksController < ApplicationController
  before_action :require_login

  def show
    @task = Task.find(params[:id])
  end
  def index
    @tasks = current_user.tasks.sorted_by_done_at
  end

  def new
    @task = current_user.tasks.new
  end

  def create
    @task = current_user.tasks.new(task_params)
    if @task.save
      redirect_to tasks_url, notice: "Task Added!"
    else
      flash.now.alert = "Please try again!"
      render :new
    end
  end

  def destroy
    @task = current_user.tasks.where(id: params[:id]).take
    @task.destroy
    redirect_to tasks_url, notice: "Task Deleted!"
  end

  def clear
    @task = current_user.tasks.find(params[:id])
    if @task.is_daily
      @task.update(done_at: Date.today + 1)
    else
      @task.update(done_at: Time.now.in_time_zone)
    end
    redirect_to tasks_url, notice: "Task Visited!"
  end

  def edit
    @task = current_user.tasks.find(params[:id])
  end

  def update
    @task = current_user.tasks.find(params[:id])
    if @task.update(task_params)
      redirect_to tasks_url, notice: "Task Updated!"
    else
      flash.now.alert = "Please try again!"
      render :edit
    end
  end

  private

  def task_params
    params.require(:task).permit(:name, :comment, :done_at, :is_daily)
  end
end
