class Task < ActiveRecord::Base
  validates :name, presence: true

  scope :sorted, ->{ order('done_at asc') }
  scope :reverse, ->{ order('id desc') }

  def time_passed_by
    ((Time.now.in_time_zone - done_at)/2.hour).to_i
  end
end
