class Board < ActiveRecord::Base
  has_many :pins, dependent: :destroy
  has_many :boardships, dependent: :destroy
  
  belongs_to :user
  validates :name, presence: true
end
