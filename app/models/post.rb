class Post < ActiveRecord::Base

  belongs_to :topic
  belongs_to :user

  delegate :username, to: :user, prefix: true

  validates :content, presence: true, length: {maximum: 1024, minimum: 1 }

  before_update :update_topic_time

  scope :order_by_time, -> { order("updated_at DESC") }

  def update_topic_time
    self.topic.touch
  end


end
