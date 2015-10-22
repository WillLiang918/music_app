class User < ActiveRecord::Base

  validates :email, :password_digest, :session_token, presence: true
  # before_action :ensure_session_token
  validates :password, length: { minimum: 4 }
  after_initialize :ensure_session_token

  attr_reader :password

  def self.generate_session_token
    token = SecureRandom.urlsafe_base64
  end

  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)
    return nil unless user
    return user if user.is_password?(password)
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    self.save!
  end

  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end

  def password=(new_password)
    @password = new_password
    self.password_digest = BCrypt::Password.create(new_password)
  end

  def password
    @password ||= BCrypt::Password.new(self.password_digest)
  end

  def is_password?(pass)
    self.password.is_password?(pass)
  end

end
