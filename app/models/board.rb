class Board < ActiveRecord::Base

  belongs_to :forum

  has_many :sub_boards
  has_many :topics, through: :sub_boards

  validates :title, presence: true, uniqueness: {case_sensitive: false },
            length: {maximum: 100, minimum: 2 }

end
