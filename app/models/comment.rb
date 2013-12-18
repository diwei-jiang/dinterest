class Comment < ActiveRecord::Base
  default_scope order('comments.created_at DESC')

  belongs_to :user
  belongs_to :pin

  validates :content,  presence: true
end
