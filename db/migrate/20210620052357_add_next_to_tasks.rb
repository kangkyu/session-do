class AddNextToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :later, :integer
  end
end
