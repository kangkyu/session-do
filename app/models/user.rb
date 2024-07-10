class User < ActiveRecord::Base
  has_many :tasks, dependent: :destroy
  has_many :visits

  has_secure_password validations: false
  has_secure_token :auth_token, length: 36, on: :initialize

  validates :password, presence: true, on: :create

  validates :email, presence: true,
                  format: /\A\S+@\S+\z/,
                  uniqueness: { case_sensitive: false }
end
