class Visit < ActiveRecord::Base
  belongs_to :task

  # after_initialize :defaults
  # def defaults
  #   self.note ||= "visited default"
  # end
end
