class User < ActiveRecord::Base
  has_many :pins, dependent: :destroy

  has_many :comments, dependent: :destroy

  has_many :boards, dependent: :destroy

  has_many :boardships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_boards, through: :boardships, source: :board

  has_many :likeships, dependent: :destroy
  has_many :liked_pins, through: :likeships, source: :pin

  has_many :friendships, foreign_key: "sender_id", 
                        dependent: :destroy
  has_many :requested_users, through: :friendships,
                      source: :receiver


  before_save { self.email = email.downcase }
  before_create :create_remember_token

  validates :name,  presence: true, length: { maximum: 50 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, length: { minimum: 6 }

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def feed
    # This is preliminary.
    # See "Following users" for the full implementation.
    Pin.where("board_id IN (?) OR user_id = ?", followed_boards, id)
  end

  def get_tags pins
    tags = []
    # pin's tags
    pins.each do |pin|
      description_tags = description_extract pin
      tags = tags + pin.get_tags + description_tags
    end

    return tags.uniq
  end

  def recommend
    recommend_pins = []
    user_cared = self.feed
    user_tags = self.get_tags user_cared
    user_tags.each do |tag|
      recommend_pins = recommend_pins + tag.pins
    end
    recommend_pins = (recommend_pins.uniq - user_cared).shuffle.slice(0,5)
  end

  def description_extract pin
    description_tags = []
    key_words = pin.description.split(/[.,\"\\?!:']/)
    key_words.each do |w|
      description_tags.push(Tag.find_by(name:w)) unless Tag.find_by(name:w).nil?
    end
    description_tags.uniq
  end

  private
    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end
end