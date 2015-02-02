class Topic < ActiveRecord::Base

  has_many   :posts
  belongs_to :user   #topic creator
  belongs_to :sub_board

  validates :title, presence: true, uniqueness: {case_sensitive: false },
            length: {maximum: 50, minimum: 2 }

  before_create :set_post_count

  def set_post_count
    self.post_count = 0
  end
end
