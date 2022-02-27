module ApplicationHelper

  def class_name_by_key(key)
    case key
    when "notice" then "alert-success"
    when "alert" then "alert-warning"
    else "alert-default"
    end
  end

  def current_cont?(controller, action = nil)
    if action
      controller_name == controller && action_name == action
    else
      controller_name == controller
    end
  end

  def content_id
    "#{controller_name.underscore}_#{action_name}"
  end

  def current_second
    "00:#{Time.now.strftime('%S')}"
  end
end
