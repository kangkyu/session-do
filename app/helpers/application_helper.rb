module ApplicationHelper
  def tailwind_class_by_key(key)
    case key
    when "notice" then "bg-green-100 border-l-4 border-green-500 text-green-700"
    when "alert" then "bg-yellow-100 border-l-4 border-yellow-500 text-yellow-700"
    else "bg-gray-100 border-l-4 border-gray-500 text-gray-700"
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
