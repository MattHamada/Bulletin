class Board < ActiveRecord::Base


  has_many :sub_boards
  #has_many :topics, through: :sub_boards

end
