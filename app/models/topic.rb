class Topic < ActiveRecord::Base

  has_many   :posts
  belongs_to :user   #topic creator
  belongs_to :sub_board
end
