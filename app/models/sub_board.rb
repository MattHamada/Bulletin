class SubBoard < ActiveRecord::Base

  belongs_to :board, dependent: :destroy
  has_many :topics
  has_many :posts, through: :topics

  validates :title, presence: true, length: {maximum: 100, minimum: 2 }
  validate :title_unique_in_board

  def title_unique_in_board
    #must compare to  < 2 and not 0 as the one being validated will be counted if matched
    errors.add(:title, 'Sub-board title must be unique in board') unless
        self.board.sub_boards.where(title: self.title).count < 2
  end
end
