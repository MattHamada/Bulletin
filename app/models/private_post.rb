class PrivatePost < ActiveRecord::Base

  belongs_to :private_message
  belongs_to :user

  delegate :username, to: :user, prefix: true

  validates :content, presence: true, length: {maximum: 1024}

  before_create :append_signature
  before_update :update_private_message_time
  before_create :update_private_message_time

  scope :order_by_time, -> { order("updated_at DESC") }

  def update_private_message_time
    self.private_message.touch
  end

  def append_signature
    content = self.content + "\n---\n#{self.user.signature}"
    self.content = content
  end

end