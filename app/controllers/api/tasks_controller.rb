module Api
  class TasksController < Api::BaseController
    def index
      tasks = current_user.tasks.sorted_by_done_at
      render json: tasks
    end

    def clear
      task = current_user.tasks.find_by(id: params[:id])
      task.visit!
    end

    # TODO: add more actions
  end
end
