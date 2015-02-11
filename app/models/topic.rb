require 'time_formatting'

class Topic < ActiveRecord::Base
  include TimeFormatting

  has_many   :posts
  belongs_to :creator, class_name: 'User'   #topic creator
  belongs_to :sub_board

  delegate :username, to: :creator, prefix: true

  validates :title, presence: true, length: {maximum: 100, minimum: 2 }

  before_create :set_post_count

  scope :order_by_time, -> { order("updated_at DESC") }


  def set_post_count
    self.post_count = 0
  end
end
