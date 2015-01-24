class TasksController < ApplicationController
  before_action :require_login

  def index
    @tasks = current_user.tasks.put_off.sorted_by_done_at
  end

  def index_daily
    @tasks = current_user.tasks.daily.sorted_by_done_at
  end

  def new
    @task = current_user.tasks.new
  end

  def create
    @task = current_user.tasks.new(task_params)
    if @task.save
      redirect_to either_tasks_url(@task)
    else
      render :new
    end
  end

  def destroy
    @task = current_user.tasks.where(id: params[:id]).take
    @task.destroy
    redirect_to either_tasks_url(@task)
  end

  def clear
    @task = current_user.tasks.find(params[:id])
    if @task.is_daily
      @task.update(done_at: Date.today + 1)
    else
      @task.update(done_at: Time.now.in_time_zone)
    end
    redirect_to either_tasks_url(@task)
  end

  def toggle_daily
    @task = current_user.tasks.find(params[:id])
    if @task.is_daily
      @task.update(is_daily: false)
    else
      @task.update(is_daily: true)
    end
    redirect_to either_tasks_url(@task)
  end

  def edit
    @task = current_user.tasks.find(params[:id])
  end

  def update
    @task = current_user.tasks.find(params[:id])
    if @task.update(task_params)
      redirect_to either_tasks_url(@task)
    else
      render :edit
    end
  end

  private
  def task_params
    params.require(:task).permit(:name, :comment, :done_at, :is_daily)
  end
end
