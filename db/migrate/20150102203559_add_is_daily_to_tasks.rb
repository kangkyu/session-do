class AddIsDailyToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :is_daily, :boolean
  end
end
