module TasksHelper

  def daily_badge(task)
    'daily' if task.is_daily
  end

  def link_to_daily(task, options={})
    if task.is_daily
      link_to("not daily", toggle_daily_task_path(task), {class:'btn btn-info btn-xs'})
    else
      link_to("daily now", toggle_daily_task_path(task), {class:'btn btn-success btn-xs'})
    end
  end
end
