class SubBoard < ActiveRecord::Base

  belongs_to :board
  has_many :topics
  has_many :posts, through: :topics
end
