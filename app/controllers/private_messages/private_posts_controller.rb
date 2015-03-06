class PrivateMessages::PrivatePostsController < ApplicationController
  include SessionsHelper

  before_action :get_private_message, only: [:new, :create]

  def new
    @private_post = PrivatePost.new(private_message: @private_message)
  end

  def create
    @private_post = PrivatePost.new(post_params)
    @private_post.private_message = @private_message
    @private_post.user = current_user
    if @private_post.save
      redirect_to private_message_path(@private_message)
    else
      render 'private_messages/private_posts/new'
    end
  end

  private
    def get_private_message
      @private_message = PrivateMessage.find(params[:private_message_id])
    end

    def private_post_params
      params.require(:private_post).permit(:content)
    end
end