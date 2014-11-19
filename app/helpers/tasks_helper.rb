module TasksHelper

  def time_been(time)
    ((Time.now - time)/1.hour).round
  end
end
