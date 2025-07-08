class User < ActiveRecord::Base
  before_save :downcase_email

  has_many :tasks, dependent: :destroy
  has_many :visits

  has_secure_password validations: false
  has_secure_token :auth_token, length: 36, on: :initialize

  validates :password, presence: true, on: :create

  validates :email, presence: true,
                  format: /\A\S+@\S+\z/,
                  uniqueness: { case_sensitive: false }

  private

  def downcase_email
    self.email = email.downcase if email.present?
  end
end
