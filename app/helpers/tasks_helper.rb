module TasksHelper

  def task_name(task)
    if task.is_daily
      daily_task_name(task)
    else
      non_daily_task_name(task)
    end
  end

  def text_and_icon(text, icon_name)
     content_tag(:i, content_tag(:span, text, class: "text-remover"), class: ["fa", "fa-" + icon_name])
  end

  private

  def daily_task_name(task)
    content_tag(:span, task.name, class: ["btn", "btn-daily"], id: 'task-name')
  end

  def non_daily_task_name(task)
    content_tag(:span, task.name, class: ["btn", "btn-non-daily"], id: 'task-name')
  end
  
end
