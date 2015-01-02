module TasksHelper

  def daily_badge(task)
    'daily' if task.is_daily
  end
end
