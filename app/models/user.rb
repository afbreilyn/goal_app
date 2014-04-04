class User < ActiveRecord::Base
  attr_reader :password

  validates :username, presence: true, uniqueness: true
  validates :token, presence: true, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }
  validates :password_digest, presence: true

  before_validation :ensure_token

  has_many(
    :goals,
    inverse_of: :user
  )

  has_many :comments, as: :commentable

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    return user if user.is_password?(password)

    nil
  end

  def self.generate_token
    SecureRandom.urlsafe_base64(16)
  end

  def reset_token!
    self.token = self.class.generate_token
    self.save!
    self.token
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  private
  def ensure_token
    self.token ||= self.class.generate_token
  end

end
