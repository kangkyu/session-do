module TasksHelper

  def task_name(task)
    task_name_class = task.with_interval? ? "text-green-500 font-bold p-0" : "text-blue-500 font-bold p-0"
    content_tag(:span, truncate(task.name), class: task_name_class, id: 'task-name', title: task.name)
  end

  def task_date(task)
    if task.done_at > Time.current.beginning_of_year
      task.done_at.strftime("%b %d")
    else
      task.done_at.strftime("%b %d, %Y")
    end
  end

  def progress_bar_tag(task)
    bar_color_class = if task.time_passed_by < 0
                        "bg-green-500" # Previously bg-success
                      elsif task.with_interval?
                        "bg-amber-400" # Previously bg-warning
                      else
                        "bg-blue-500" # Previously bg-primary
                      end

    direction_class = task.time_passed_by < 0 ? "flex-row-reverse" : ""

    content_tag(:div, "", class: "w-full bg-gray-200 rounded h-4 flex #{direction_class}") do
      content_tag(:div, "",
        "aria-valuemax" => "100",
        "aria-valuemin" => "0",
        "aria-valuenow" => task.bar_length,
        role: "progressbar",
        style: "width: #{task.bar_length}%;",
        class: "#{bar_color_class} rounded")
    end
  end

  def progress_bar_text(task)
    last_word = task.time_passed_by < 0 ? " from now" : " ago"
    content_tag(
      :div,
      distance_of_time_in_words_to_now(task.done_at) + last_word,
      class: "text-white text-xs absolute inset-0 flex items-center justify-center text-shadow-sm"
    )
  end
end
