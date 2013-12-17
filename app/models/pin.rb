class Pin < ActiveRecord::Base
  belongs_to :user
  belongs_to :board

  has_many :likerships, dependent: :destroy
  has_many :likers, through: :likerships, source: :user

  has_many :tagships, dependent: :destroy
  has_many :tags, through: :tagships

  has_many :comments, dependent: :destroy
  
  default_scope -> { order('created_at DESC') }
  validates :description, presence: true, length: { maximum: 140 }
  validates :user_id, presence: true
  validates :board_id, presence: true
  validates :url, presence: true
end