class ChangeIsDailyDefault < ActiveRecord::Migration[8.0]
  def up
    change_column_default(:tasks, :is_daily, false)
  end

  def down
    change_column_default(:tasks, :is_daily, nil)
  end
end
