module TasksHelper

  def task_name(task)
    if task.is_daily
      content_tag(:span, truncate(task.name), class: ["btn", "btn-daily"], id: 'task-name')
    else
      content_tag(:span, truncate(task.name), class: ["btn", "btn-non-daily"], id: 'task-name')
    end
  end

  def fa_icon_with_removed_text(icon_name, options={})
    text = options.delete(:text)
    right = options.delete(:right)
    fa_icon(icon_name, text: content_tag(:span, text, class: "text-remover"), right: right)
  end

  def progress_bar_tag(task)

    if task.time_passed_by < 0
      content_tag(:div, "",
        "aria-valuemax" => "100", "aria-valuemin" => "0", "aria-valuenow" => task.bar_length,
        :role => "progressbar", :style => "width: #{task.bar_length}%; float: right;",
        class: ["progress-bar", "progress-bar-warning"])
    else
      content_tag(:div,
        "aria-valuemax" => "100", "aria-valuemin" => "0", "aria-valuenow" => task.bar_length,
        :role => "progressbar", :style => "width: #{task.bar_length}%;",
        class: ["progress-bar", "progress-bar-primary"]) do
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
