class TasksController < ApplicationController
  before_action :require_login
  # before_action :load_task, only: [:show, :destroy, :clear, :edit, :update]

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

  def show
    load_task
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
    redirect_to @task, notice: "Task Visited!"

    @visit = Visit.create(
      user_id: session[:user_id],
      task_id: params[:id],
      note:
        if !params[:visit] || params[:visit][:note].blank?
          "visited!"
        else
          params.require(:visit).permit(:note)["note"]
        end
    )
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
