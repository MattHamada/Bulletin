require 'time_formatting'

class Topic < ActiveRecord::Base
  include TimeFormatting

  has_many   :posts
  belongs_to :creator, class_name: 'User'   #topic creator
  belongs_to :sub_board

  validates :title, presence: true, uniqueness: {case_sensitive: false },
            length: {maximum: 100, minimum: 2 }

  before_create :set_post_count

  scope :order_by_time, -> { order("updated_at ASC") }


  def set_post_count
    self.post_count = 0
  end
end
