class Task < ActiveRecord::Base
  scope :sorted, ->{ order('done_at asc') }

  def time_passed_by
    ((Time.now.in_time_zone - done_at)/2.hour).to_i
  end
end
