json.array!(@tasks) do |task|
  json.extract! task, :id, :name, :comment, :done_at, :is_daily

end