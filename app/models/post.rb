class Post < ActiveRecord::Base

  belongs_to :topic
  belongs_to :user

  delegate :username, to: :user, prefix: true

  validates :content, presence: true, length: {maximum: 1024, minimum: 1 }

  before_update :update_topic_time
  before_create :update_user_post_count

  scope :order_by_time, -> { order("updated_at DESC") }

  def update_topic_time
    self.topic.touch
  end

  def update_user_post_count
    self.user.post_count += 1
  end


end
