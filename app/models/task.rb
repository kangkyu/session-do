class Task < ActiveRecord::Base
  scope :sorted, ->{ order('done_at asc') }
end
