class User < ApplicationRecord
  before_create :generate_authentication_token

  # 确保确认密码不为空
  validates :password_confirmation, presence: true
  has_secure_password

  # 用户含有多个微博
  has_many :microposts, dependent: :destroy

  def generate_authenticati on_token
    loop do
      self.authentication_token = SecureRandom.base64(64)
      break if !User.find_by(authentication_token: authentication_token)
    end
  end

  def reset_auth_token!
    generate_authentication_token
    save
  end
end
