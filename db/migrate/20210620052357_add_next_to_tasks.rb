class AddNextToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :next, :integer
  end
end
