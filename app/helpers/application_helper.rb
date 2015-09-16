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
end
