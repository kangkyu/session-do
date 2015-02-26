class TasksController < ApplicationController
  before_action :require_login

  def index
    flash[:notice] = "Non-Daily Tasks"
    @tasks = current_user.tasks.put_off.sorted_by_done_at
  end

  def index_daily
    flash[:notice] = "Daily Tasks"
    @tasks = current_user.tasks.daily.sorted_by_done_at
  end

  def new
    @task = current_user.tasks.new
  end

  def create
    @task = current_user.tasks.new(task_params)
    if @task.save
      redirect_to either_tasks_url(@task), notice: "Task Added!"
    else
      flash.now.alert = "Please try again!"
      render :new
    end
  end

  def destroy
    @task = current_user.tasks.where(id: params[:id]).take
    @task.destroy
    redirect_to either_tasks_url(@task), notice: "Task Deleted!"
  end

  def clear
    @task = current_user.tasks.find(params[:id])
    if @task.is_daily
      @task.update(done_at: Date.today + 1)
    else
      @task.update(done_at: Time.now.in_time_zone)
    end
    redirect_to either_tasks_url(@task), notice: "Task Cleared!"
  end

  def toggle_daily
    @task = current_user.tasks.find(params[:id])
    if @task.is_daily
      @task.update(is_daily: false)
      redirect_to daily_tasks_url, notice: "Task Moved to Non-Dailies"
    else
      @task.update(is_daily: true)
      redirect_to tasks_url, notice: "Task Moved to Dailies"
    end
  end

  def edit
    @task = current_user.tasks.find(params[:id])
  end

  def update
    @task = current_user.tasks.find(params[:id])
    if @task.update(task_params)
      redirect_to either_tasks_url(@task), notice: "Task Updated!"
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
