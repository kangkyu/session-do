module TasksHelper

  def daily_badge(task)
    'daily' if task.is_daily
  end

  def link_to_daily(task, options={})
    if task.is_daily
      link_to icon('arrow-right'), toggle_daily_task_path(task), class:'btn btn-info'
    else
      link_to icon('arrow-left'), toggle_daily_task_path(task), class:'btn btn-success'
    end
  end
end
