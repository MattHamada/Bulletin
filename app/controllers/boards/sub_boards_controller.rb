class Boards::SubBoardsController < ApplicationController

  before_action :get_sub_board


  def show
    add_breadcrumb @sub_board.board.title, root_path
    add_breadcrumb @sub_board.title, board_sub_board_path(@sub_board.board, @sub_board)
    @topics = @sub_board.topics.order_by_time
  end


  private
    def get_sub_board
      @sub_board ||= SubBoard.find(params[:id])
    end
end
