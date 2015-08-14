module ApplicationHelper

  def class_name_by_key(key)
    case key
    when "notice" then "alert-success"
    when "alert" then "alert-warning"
    else "alert-default"
    end
  end

  def helper_bar_center_button
    if controller_name == 'sessions' && action_name == 'new' # :session_new
      link_to "Sign Up", register_path, class: 'btn btn-link'
    elsif controller_name == 'users' && action_name == 'new' # :user_new
      link_to "Log In", login_path, class: 'btn btn-link'
    elsif controller_name == 'tasks' && action_name == 'index' # :task_index
      link_to fa_icon_with_removed_text('plus', text: "Add Task", right: false), new_task_path, class: 'btn btn-non-daily'
    elsif (controller_name == 'tasks' && action_name == 'edit') ||
      (controller_name == 'tasks' && action_name == 'new') ||
      (controller_name == 'users' && action_name == 'edit')
    # :task_form, :user_edit
      link_to fa_icon('arrow-left', text: 'Back', right: false), tasks_path, class: 'btn btn-non-daily'
    else
      "Any link or button?"
    end
  end

  def helper_bar_right_button
    if controller_name == 'users' && action_name == 'new'
      link_to "First time?", welcome_guide_path, class: 'btn btn-link'
    end
  end
end
