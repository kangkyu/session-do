# following instruction as such:

# DEPRECATION WARNING: Leaving `ActiveRecord::ConnectionAdapters::SQLite3Adapter.represent_boolean_as_integer`
# set to false is deprecated. SQLite databases have used 't' and 'f' to serialize
# boolean values and must have old data converted to 1 and 0 (its native boolean
# serialization) before setting this flag to true. Conversion can be accomplished
# by setting up a rake task which runs

#   ExampleModel.where("boolean_column = 't'").update_all(boolean_column: 1)
#   ExampleModel.where("boolean_column = 'f'").update_all(boolean_column: 0)

# for all models and all boolean columns, after which the flag must be set to
# true by adding the following to your application.rb file:

#   Rails.application.config.active_record.sqlite3.represent_boolean_as_integer = true
#
namespace :sqlite_boolean do
  desc "Convert t and f to 1 and 0 for SQLite boolean columns"
  task convert: :environment do
    Task.where("is_daily = 't'").update_all(is_daily: 1)
    Task.where("is_daily = 'f'").update_all(is_daily: 0)
  end
end
