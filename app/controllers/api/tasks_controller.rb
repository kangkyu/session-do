module Api
  class TasksController < Api::BaseController
    def index
      @tasks = current_user.tasks.sorted_by_done_at
      render :index, status: :ok
    end

    def clear
      @task = current_user.tasks.find_by(id: params[:id])
      @task.visit!
    end

    def create
      @task = current_user.tasks.new(task_params)
      @task.start_done_at
      if @task.save
        render :show, status: :created
      else
        render json: @task.errors, status: :unprocessable_entity
      end
    end

    def update
      @task = current_user.tasks.find_by(id: params[:id])

      if @task.update(task_params)
        render :show, status: :ok
      else
        render json: @task.errors, status: :unprocessable_entity
      end
    end

    def show
      @task = current_user.tasks.find_by(id: params[:id])
      render :show, statu: :ok
    end

    def destroy
      @task = current_user.tasks.find_by(id: params[:id])
      @task.destroy
    end

    private

    def task_params
      params.require(:task).permit(:name, :comment, :done_at, :is_daily, :later)
    end
  end
end
