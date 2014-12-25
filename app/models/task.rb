class Task < ActiveRecord::Base
  belongs_to :user
  
  validates :name, presence: true

  scope :sorted, ->{ order('done_at desc') }
  scope :reverse, ->{ order('id desc') }

  def time_passed_by
    ((Time.now.in_time_zone - done_at)/2.hour).to_i
  end
end
