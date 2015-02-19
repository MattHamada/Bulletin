class TopicsController < ApplicationController
  include SessionsHelper
  before_action :get_topic

  def new
    sub_board = SubBoard.find(params[:sub_board_id])
    @topic = Topic.new(sub_board_id: sub_board.id)
  end

  def create
    post_text = params[:topic][:post_text]
    @topic = Topic.new(topic_params)
    @topic.creator_id = current_user.id
    if @topic.save
      @post = Post.create(content: post_text,
                          user_id: current_user.id,
                          topic_id: @topic.id)
      redirect_to topic_path(@topic)
    else
      flash[:danger] = @topic.errors.full_message
      render new_topic_path(sub_board: params[:topic][:sub_board_id])
    end

  end

  def show
    add_breadcrumb @topic.sub_board.board.title, root_path
    add_breadcrumb @topic.sub_board.title, board_sub_board_path(@topic.sub_board.board, @topic.sub_board)
    add_breadcrumb @topic.title, topic_path(@topic)
    @posts = @topic.posts.order_by_time
  end

  private
    def get_topic
      @topic = Topic.find_by_id(params[:id])
    end

    def topic_params
      params.require(:topic).permit(:title, :sub_board_id)
    end

end