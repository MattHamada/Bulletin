class UsersController < ApplicationController
  include SessionsHelper

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      redirect_to root_path
    else
      render new_user_path
    end
  end

  def show
    @user = User.find_by_slug(params[:id])
  end

  private
    def user_params
      params.require(:user).permit(:avatar, :username, :email, :password,
                                   :password_confirmation, :signature, :timezone)
    end

end