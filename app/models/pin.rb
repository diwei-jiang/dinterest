class Pin < ActiveRecord::Base
  default_scope order('pins.created_at DESC')

  belongs_to :user
  belongs_to :board

  has_many :likeships, dependent: :destroy
  has_many :likers, through: :likeships, source: :user

  has_many :tagships, dependent: :destroy
  has_many :tags, through: :tagships

  has_many :comments, dependent: :destroy
  
  validates :description, presence: true, length: { maximum: 140 }
  validates :user_id, presence: true
  validates :board_id, presence: true
  validates :url, presence: true

  def self.tagged_with(name)
    Tag.find_by_name!(name).pins
  end

  def self.tag_counts
    Tag.select("tags.*, count(tagships.tag_id) as count").
      joins(:tagships).group("tagships.tag_id")
  end

  def tag_list
    tags.map(&:name).join(", ")
  end
  
  def tag_list=(names)
    self.tags = names.split(",").map do |n|
      Tag.where(name: n.strip).first_or_create!
    end
  end

  def get_tags
    self.tags
  end
end