class GenerateUserAuthToken < ActiveRecord::Migration[7.1]
  def change
    User.find_each do |user|
      user.save
    end
  end
end
