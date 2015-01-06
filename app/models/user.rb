class User < ActiveRecord::Base
  attr_accessor :remember_token
  before_save   :downcase_email
  has_many :enrolls
  validates :name,  presence: true, :uniqueness=>true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                format: { with: VALID_EMAIL_REGEX },uniqueness: { case_sensitive: false }
  
  has_secure_password
  validates :password, length: { minimum: 6 }, allow_blank: true, confirmation: true
  validates :password_confirmation, length: { minimum: 6 }

  def User.digest string
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
            BCrypt::Engine.cost
            BCrypt::Password.create(string, cost: cost)
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def downcase_email
    self.email = email.downcase
  end

  def remember
    self.remember_token = User.new_token
    self.password_not_require = true
    update_attributes :remember_digest, User.digest(remember_token)
    self.password_not_require = false
  end

  def authenticated? remember_token
    return false if remember_token.nil?
    BCrypt::Password.new(remember_token).is_password?(remember_token)
  end

  def forget
    self.password_not_require = true
    update_attributes :remember_digest, nil
    self.password_not_require = false
  end
end
