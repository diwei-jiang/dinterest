class Pin < ActiveRecord::Base
  belongs_to :user
  belongs_to :board
  has_many :comments

  
  default_scope -> { order('created_at DESC') }
  validates :description, presence: true, length: { maximum: 140 }
  validates :user_id, presence: true
end