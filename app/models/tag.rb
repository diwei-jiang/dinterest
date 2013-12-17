class Tag < ActiveRecord::Base
  has_many :tagships, dependent: :destroy
  has_many :pins, through: :tagships

  validates :name, presence: true
end
