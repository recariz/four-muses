class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :follower_relationships, foreign_key: :followed_id, class_name: 'Following'
  has_many :followers, through: :follower_relationships, source: :follower

  has_many :followed_relationships, foreign_key: :follower_id, class_name: 'Following'
  has_many :followeds, through: :followed_relationships, source: :followed



  has_many :sender_relationships, foreign_key: :receiver_id, class_name: 'Chatroom'
  has_many :senders, through: :sender_relationships, source: :sender

  has_many :receiver_relationships, foreign_key: :sender_id, class_name: 'Chatroom'
  has_many :receivers, through: :receiver_relationships, source: :receiver

  has_many :messages
  has_many :contests
  has_many :contest_applications

  def follow(user_id)
    followed_relationships.create(followed_id: user_id)
  end

  def unfollow(user_id)
    followed_relationships.find_by(followed_id: user_id).destroy
  end

  def is_following?(user_id)
    relationship = Following.find_by(follower_id: id, followed_id: user_id)
    return true if relationship
  end

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :interests, dependent: :destroy
  has_many :categories, through: :interests

  validates :email, :password, :nickname, :location, presence: true


  has_one_attached :avatar, dependent: :destroy


  def artist?
    type == 'Artist'
  end

  def business?
    type == 'Business'
  end


end
