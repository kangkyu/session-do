def user_attributes(overrides={})
  {
    username: "jimmy", 
    email: "jimmy@example.com", 
    password: "1111"      
  }.merge(overrides)
end