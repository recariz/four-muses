class Following < ApplicationRecord
  belongs_to :follower, foreign_key: :follower_id, class_name: 'User'
  belongs_to :followed, foreign_key: :followed_id, class_name: 'User'
  validates_uniqueness_of :follower_id, scope: :followed_id
  has_many :followed_posts, through: :followed, source: :posts

end
