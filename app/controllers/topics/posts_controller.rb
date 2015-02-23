class Topics::PostsController < ApplicationController
  include SessionsHelper
  before_action :get_topic, only: [:new, :create]
  def new
    add_breadcrumb @topic.sub_board.board.title, root_path
    add_breadcrumb @topic.sub_board.title, board_sub_board_path(@topic.sub_board.board, @topic.sub_board)
    add_breadcrumb @topic.title, topic_path(@topic)
    @post = Post.new(topic: @topic)
  end

  def create
    pp = post_params
    content = pp[:content] + "\n---\n#{current_user.signature}"
    @post = Post.new(content: content)
    @post.topic = @topic
    @post.user = current_user
    if @post.save
      redirect_to topic_path(@post.topic)
    else
      render 'topics/posts/new'
    end

  end

  private
    def get_topic
      @topic = Topic.find(params[:topic_id])
    end

    def post_params
      params.require(:post).permit(:content)
    end

end