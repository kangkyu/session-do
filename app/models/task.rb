class Task < ActiveRecord::Base
  belongs_to :user
  has_many :visits

  validates :name, presence: true
  validates :comment, length: { maximum: 255 }, allow_blank: true
  validates :later, numericality: { greater_than: 0 }, allow_nil: true

  scope :daily, ->{ where(is_daily: true) }
  scope :put_off, ->{ where(is_daily: false)}
  scope :sorted_by_done_at, ->{ order('done_at desc') }

  scope :sorted_nested, ->{ order('is_daily desc, done_at desc') }
  scope :reverse_of_id, ->{ order('id desc') }

  def time_passed_by
    (Time.now.in_time_zone - done_at).to_i/3600
  end

  def bar_length
    time_passed_by.abs.to_i/2
  end

  def with_interval?
    is_daily || later.present?
  end

  def start_done_at
    timestamp = done_at || Time.now.in_time_zone
    self.done_at =
      if later.present?
        timestamp + later.days
      elsif is_daily
        timestamp + 1.day
      else
        timestamp
      end
  end

  def restart_done_at
    self.done_at = nil
    start_done_at
  end
end
