require 'time_formatting'

class PrivateMessage < ActiveRecord::Base
  include TimeFormatting

  has_many :private_posts
  belongs_to :creator, class_name: 'User'
  belongs_to :recipient, class_name: 'User'

  accepts_nested_attributes_for :private_posts

  delegate :username, to: :creator,   prefix: true
  delegate :username, to: :recipient, prefix: true

  validates :title, length: {maximum: 100, minimum: 2 }

  scope :order_by_time, -> { order("updated_at DESC") }


  #returns PMs where user is creator or recipient
  def self.shared_with(user)
    t = self.arel_table
    self.where(t[:creator_id].eq(user.id).or(t[:recipient_id].eq(user.id)))
  end
end