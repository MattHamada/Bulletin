require 'cookie_crypt'

class User < ActiveRecord::Base
  include CookieCrypt

  has_many :topics

  validates :username, length: {minimum: 3, maximum: 15}, uniqueness: { case_sensitive: false }
  validates :password, password_complexity: true
  validates :email, uniqueness: {case_sensitive: false},
                    email_format: true
  validates :slug, uniqueness: true
  validates :signature, length: { maximum: 100 }

  before_create :generate_slug

  before_save { self.email = email.downcase }
  before_save { self.username = username.downcase }
  before_create :create_remember_token
  before_create { self.post_count = 0 }
  before_create { self.signature = '' }

  has_secure_password
  has_attached_file :avatar, :styles => { :default => "200x200>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  #validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  validates_attachment_file_name :avatar, :matches => [/png\Z/, /jpe?g\Z/, /gif\Z/]
  validates_attachment :avatar,
                       :content_type => { :content_type => ["image/jpg", "image/jpeg", "image/gif", "image/png"] }

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
