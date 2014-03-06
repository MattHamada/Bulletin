require 'cookie_crypt'

class User < ActiveRecord::Base
  include CookieCrypt

  has_many :topics

  validates :username, presence: true, length: {minimum: 3, maximum: 15}
  validates :password, password_complexity: true, presence: true
  validates :email, presence: true,
                    uniqueness: {case_sensitive: false},
                    email_format: true
  validates :slug, uniqueness: true, presence: true
  before_validation :generate_slug

  before_save { self.email = email.downcase }
  before_create :create_remember_token

  has_secure_password

  def generate_slug
    self.slug ||= username.parameterize
  end

  def to_param
    slug
  end

  private

  def create_remember_token
    self.remember_token = encrypt(new_remember_token)
  end

end
