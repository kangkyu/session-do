class VisitOldTasks < ActiveRecord::Migration[5.2]
  def change
    reversible do |dir|
      Task.find_each do |t|
        dir.up do
          if t.visits.empty?
            t.visits << t.visits.build(user_id: t.user.id)
            t.visits.last.update(created_at: t.done_at, updated_at: t.done_at)
          end
        end
        dir.down do
          # values will be removed if removing visits table
          # (rollback CreateVisits migration)
        end
      end
    end
  end
end
