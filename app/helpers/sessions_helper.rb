module SessionsHelper

  def user_signed_in?
    !current_user.nil?
  end

  def current_user
    remember_token = my_encrypt(cookies[:remember_token])
    @current_user ||= User.find_by(remember_token: remember_token)
  end


  def current_user=(user)
    @current_user = user
  end

  def my_encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def new_remember_token
    SecureRandom.urlsafe_base64
  end

  def sign_in(user)
    remember_token = new_remember_token
    cookies.permanent[:remember_token] = remember_token
    user.update_attribute(:remember_token, my_encrypt(remember_token))
    self.current_user = user
  end
end