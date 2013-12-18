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

  private
    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end
end