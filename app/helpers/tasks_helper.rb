module TasksHelper

  def task_name(task)
    task_name_class = task.is_daily ? "task-daily" : "task-non-daily"

    content_tag(:span, truncate(task.name), class: task_name_class, id: 'task-name')
  end

  def fa_icon_with_removed_text(icon_name, options={})
    text = options.delete(:text)
    right = options.delete(:right)
    fa_icon(icon_name, text: content_tag(:span, text, class: "text-remover"), right: right)
  end

  def progress_bar_tag(task)
    bar_color_class = task.is_daily ? "progress-bar-success" : "progress-bar-primary"

    if task.time_passed_by < 0
      content_tag(:div, "",
        "aria-valuemax" => "100", "aria-valuemin" => "0", "aria-valuenow" => task.bar_length,
        :role => "progressbar", :style => "width: #{task.bar_length}%; float: right;",
        class: ["progress-bar", "progress-bar-warning"])
    else
      content_tag(:div,
        "aria-valuemax" => "100", "aria-valuemin" => "0", "aria-valuenow" => task.bar_length,
        :role => "progressbar", :style => "width: #{task.bar_length}%;",
        class: ["progress-bar", bar_color_class]) do
          content_tag(:span, distance_of_time_in_words_to_now(task.done_at).concat(" ago"))
      end
    end
  end

  def progress_bar_text(task)
    if task.time_passed_by < 0
      content_tag(:span, distance_of_time_in_words_to_now(task.done_at).concat(" from now"), class: "bar-text-color-white")
    end
  end

end
