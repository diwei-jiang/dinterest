class Boardship < ActiveRecord::Base
  belongs_to :board, class_name: "Board"
  belongs_to :board_follower, class_name: "User"
  validates :board_id, presence: true
  validates :follower_id, presence: true
end
