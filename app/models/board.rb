class Board < ActiveRecord::Base
  belongs_to :user
  has_many :pins, dependent: :destroy
  has_many :boardships, dependent: :destroy
  has_many :follower, through: :boardships, source: :board_follower
  
  belongs_to :user
  validates :name, presence: true
end
