class TasksController < ApplicationController
  before_action :require_login
  before_action :load_task, only: [
    :destroy, :clear, :edit, :update, :show
  ]

  def index
    @tasks = current_user.tasks.sorted_by_done_at
  end

  def new
    @task = current_user.tasks.new
  end

  def create
    @task = current_user.tasks.new(task_params)
    @task.start_done_at
    if @task.save
      redirect_to tasks_url, notice: "Task Added!"
    else
      flash.now.alert = "Please try again!"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_url, notice: "Task Deleted!"
  end

  def clear
    @task.visit!
    redirect_to tasks_url, notice: "Task Visited!"
  end

  def show
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to tasks_url, notice: "Task Updated!"
    else
      flash.now.alert = "Please try again!"
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def load_task
    unless @task = current_user.tasks.where(id: params[:id]).take
      redirect_to root_url, alert: "Task Missing!"
    end
  end

  def task_params
    params.require(:task).permit(:name, :comment, :done_at, :is_daily, :later)
  end
end
