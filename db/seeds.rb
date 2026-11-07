# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Visit.delete_all
Task.delete_all
User.delete_all

# Long enough that Chrome does not flag it as weak or breached.
password = "tidy-Lantern-42-orbit"

users = User.create!([
  { username: "jimmy", email: "jimmy@example.com", password: password },
  { username: "kang", email: "kang@example.com", password: password }
])

tasks = Task.create!([
  { is_daily: false, name: 'training', comment: 'work hard!', done_at: Time.current - 2.days, user: users.first, later: nil },
  { is_daily: false, name: 'well-being', comment: 'eat, drink, and sleep a lot', done_at: Time.current - 2.days, user: users.first, later: nil },
  { is_daily: true, name: 'breakfast', comment: 'do not miss', done_at: Time.current, user: users.first, later: nil },
  { is_daily: true, name: 'tea', comment: 'afternoon tea', done_at: Time.current, user: users.first, later: nil },
  { is_daily: true, name: 'lunch', comment: '', done_at: Time.current, user: users.first, later: nil }
])
