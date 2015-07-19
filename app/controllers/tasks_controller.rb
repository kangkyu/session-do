class TasksController < ApplicationController
  before_action :require_login

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
    load_task
    @task.destroy
    redirect_to tasks_url, notice: "Task Deleted!"
  end

  def clear
    load_task
    @task.update(
      done_at:
        if @task.is_daily
          Date.today + 1
        else
          Time.now.in_time_zone
        end
    )
    redirect_to tasks_url, notice: "Task Visited!"
  end

  def edit
    load_task
  end

  def update
    load_task
    if @task.update(task_params)
      redirect_to tasks_url, notice: "Task Updated!"
    else
      flash.now.alert = "Please try again!"
      render :edit
    end
  end

  private

  def load_task
    unless @task = current_user.tasks.where(id: params[:id]).take
      redirect_to root_url, alert: "Task missing!"
    end
  end

  def task_params
    params.require(:task).permit(:name, :comment, :done_at, :is_daily)
  end
end
