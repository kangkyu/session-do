module Api
  class TasksController < BaseController
    def index
      tasks = current_user.tasks.sorted_by_done_at
      render json: tasks
    end

    # TODO: add more actions
  end
end
