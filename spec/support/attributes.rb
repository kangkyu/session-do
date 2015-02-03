def user_attributes(overrides={})
  {
    username: "jimmy", 
    email: "jimmy@example.com", 
    password: "1111"      
  }.merge(overrides)
end

def task_attributes(overrides={})
  {
    name: "family dinner",
    comment: "",
    done_at: "2015-02-04 08:00:00",
    user_id: 3, 
    is_daily: true
  }.merge(overrides)
end