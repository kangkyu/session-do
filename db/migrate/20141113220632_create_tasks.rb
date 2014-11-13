class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :comment
      t.datetime :done_at

      t.timestamps
    end
  end
end
