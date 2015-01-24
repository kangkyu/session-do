module TasksHelper

  def task_name(task)
    if task.is_daily
      daily_task_name(task)
    else
      non_daily_task_name(task)
    end
  end

  def link_to_daily(task, options={})
    if task.is_daily
      link_to icon('arrow-right'), toggle_daily_task_path(task), class:'btn btn-primary'
    else
      link_to icon('arrow-left'), toggle_daily_task_path(task), class:'btn btn-success'
    end
  end

  private

  def daily_task_name(task)
    content_tag(:span, task.name, class: ["btn", "btn-daily"])
  end

  def non_daily_task_name(task)
    content_tag(:span, task.name, class: ["btn", "btn-non-daily"])
  end
  
end
