class StaticPagesController < ApplicationController

  def index
    @boards = Board.all.includes [:sub_boards, :topics]
  end

end
