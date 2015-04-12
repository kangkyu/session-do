# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
Task.delete_all
User.create!(username: "jimmy", email: "jimmy@example.com", password: "1111")
Task.create!(name: 'training', comment: 'work hard!', done_at: Time.now.in_time_zone - 2.days, user: User.first)