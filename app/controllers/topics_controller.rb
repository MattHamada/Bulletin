class TopicsController < ApplicationController
  before_action :get_topic

  def new
    sub_board = SubBoard.find(params[:sub_board])
    @topic = Topic.new(sub_board_id: sub_board)
  end
  def show
    @posts = @topic.posts.order_by_time
  end

  private
    def get_topic
      @topic = Topic.find_by_id(params[:id])
    end

end