class Forum < ActiveRecord::Base
  has_many :users
  has_many :boards

  validates :name, presence: true, length: {maximum: 50, minimum: 2 }

end