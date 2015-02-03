class Post < ActiveRecord::Base

  belongs_to :topic
  belongs_to :user

  validates :content, presence: true, length: {maximum: 1024, minimum: 1 }

  before_update :update_topic_time

  def update_topic_time
    self.topic.touch
  end

end
