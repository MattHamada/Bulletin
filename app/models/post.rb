class Post < ActiveRecord::Base

  belongs_to :topic
  belongs_to :user

  delegate :username, to: :user, prefix: true

  validates :content, presence: true, length: {maximum: 1024, minimum: 1 }

  before_update :update_topic_time
  before_create :update_topic_time
  before_create :update_user_post_count

  scope :order_by_time, -> { order("updated_at DESC") }

  def update_topic_time
    self.topic.touch
  end

  def update_user_post_count
    current_count = self.user.post_count
    self.user.update_attribute(:post_count, (current_count + 1))
    new_count = user.post_count
  end


end
