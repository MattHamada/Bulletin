class Post < ActiveRecord::Base

  belongs_to :sub_board
  belongs_to :user

  validates :content, presence: true, length: {maximum: 1024, minimum: 1 }

end
