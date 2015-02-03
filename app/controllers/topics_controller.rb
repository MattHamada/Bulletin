class TopicsController < ApplicationController
  before_action :get_topic

  def show
    @posts = @topic.posts.order_by_time
  end

  private
    def get_topic
      @topic = Topic.find_by_id(params[:id])
    end

end