class RegenerateTokensExistingUsers < ActiveRecord::Migration[7.1]
  def change
    User.find_each do |user|
      user.regenerate_auth_token if user.auth_token.nil?
      user.save
    end
  end
end
