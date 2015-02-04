class SessionsController < ApplicationController
  include SessionsHelper

  def new
    redirect_to root_path if user_signed_in?
  end

  def create
    user = User.find_by(username: params[:session][:username].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to root_path
    else
      flash.now[:danger]= 'Invalid email/password combination'
      render 'sessions/new'
    end
  end

  def destroy
    cookies.delete(:remember_token)
    self.current_user = nil
    redirect_to root_path
  end
end