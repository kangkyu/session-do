class Visit < ActiveRecord::Base
  belongs_to :task
  belongs_to :user

  # after_initialize :defaults
  # def defaults
  #   self.note ||= "visited default"
  # end
end
