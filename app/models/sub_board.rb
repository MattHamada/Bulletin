class SubBoard < ActiveRecord::Base

  belongs_to :board, dependent: :destroy
  has_many :topics
  has_many :posts, through: :topics

  validates :title, presence: true, length: {maximum: 100, minimum: 2 }
  validate :title_unique_in_board

  def title_unique_in_board
    errors.add(:title, 'Sub-board title must be unique in board') unless
        self.board.sub_boards.where(title: self.title).empty?
  end
end
