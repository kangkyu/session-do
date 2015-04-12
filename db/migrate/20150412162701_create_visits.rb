class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.integer :user_id
      t.integer :task_id
      t.text :note

      t.timestamps
    end
  end
end
