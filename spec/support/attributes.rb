def user_attributes(overrides={})
  {
    username: "jimmy",
    email: "jimmy@example.com",
    password: "1111"
  }.merge(overrides)
end

def task_attributes(overrides={})
  user = User.create!(user_attributes)
  {
    name: "family dinner",
    comment: "",
    done_at: "2015-02-04 08:00:00",
    user_id: user.id,
    is_daily: true,
    later: nil
  }.merge(overrides)
end
