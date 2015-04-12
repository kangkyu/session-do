module ApplicationHelper

  def class_name_by_key(key)
    case key 
    when "notice" then "alert-success"
    when "alert" then "alert-warning" 
    else "alert-default"
    end
  end

end
