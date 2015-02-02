class SubBoard < ActiveRecord::Base

  belongs_to :board
  has_many :topics
  has_many :posts, through: :topics

  validates :title, presence: true, uniqueness: {case_sensitive: false },
            length: {maximum: 50, minimum: 2 }
end
