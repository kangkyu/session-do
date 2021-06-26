class User < ActiveRecord::Base
  has_many :tasks, dependent: :destroy


  has_secure_password validations: false

  validates :password, presence: true

  validates :email, presence: true,
                  format: /\A\S+@\S+\z/,
                  uniqueness: { case_sensitive: false }
end
