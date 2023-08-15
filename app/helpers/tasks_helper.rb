module TasksHelper

  def task_name(task)
    task_name_class = task.with_interval? ? "task-daily" : "task-non-daily"
    content_tag(:span, truncate(task.name), class: task_name_class, id: 'task-name', title: task.name)
  end

  def task_date(task)
    if task.done_at > Time.current.beginning_of_year
      task.done_at.strftime("%b %d")
    else
      task.done_at.strftime("%b %d, %Y")
    end
  end

  def fa_icon_with_removed_text(icon_name, options={})
    text = options.delete(:text)
    right = options.delete(:right)
    fa_icon(icon_name, text: content_tag(:span, text, class: "text-remover"), right: right)
  end

  def progress_bar_tag(task)
    bar_color_class = task.time_passed_by < 0 ? "bg-success" : task.with_interval? ? "bg-warning" : "bg-primary"
    float_class = task.time_passed_by < 0 ? "flex-row-reverse" : ""
    content_tag(:div, "", class: "progress #{float_class}", style: "height: 16px;") do
      content_tag(:div, "",
        "aria-valuemax" => "100", "aria-valuemin" => "0", "aria-valuenow" => task.bar_length,
        :role => "progressbar", :style => "width: #{task.bar_length}%;",
        class: "progress-bar #{bar_color_class}")
    end
  end

  def progress_bar_text(task)
    last_word = task.time_passed_by < 0 ? " from now" : " ago"
    content_tag(
      :div, distance_of_time_in_words_to_now(task.done_at) + last_word,
      class: "bar-text-color-white", style: "display: block; width: 100%;")
  end
end
