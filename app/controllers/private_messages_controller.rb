class PrivateMessagesController < ApplicationController
  include SessionsHelper

  before_action :get_private_message

  def new
    @private_message = PrivateMessage.new(recipient_id: params[:recipient_id])
    @recipient = User.find_by_id(params[:recipient_id])
    @private_post = PrivatePost.new
  end

  def create
    @private_message = PrivateMessage.new(private_message_params)
    @private_message.creator_id = current_user.id
    @private_post = PrivatePost.new(content: params[:private_message][:private_post][:content],
                                    user_id: current_user.id)
    if @private_post.valid? && @private_message.save
      @private_post.private_message = @private_message
      @private_post.save
      redirect_to private_message_path(@private_message)
    else
      @private_message.errors.messages.merge!(@private_post.errors.messages) unless @private_message.valid?
      render new_private_message_path
    end
  end

  def index
    @private_messages = PrivateMessage.shared_with(current_user)
  end

  def show
    @private_posts = @private_message.private_posts.order_by_time
  end

  private

    def private_message_params
      params.require(:private_message).permit(:title, :recipient_id)
    end

    def get_private_message
      @private_message = PrivateMessage.find_by_id(params[:id])
    end

end