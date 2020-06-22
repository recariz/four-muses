class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :interests, dependent: :destroy
  has_many :categories, through: :interests
  validates :email, :password, :nickname, :categories, :location, presence: true
  has_one_attached :avatar, dependent: :destroy


  def artist?
    type == 'Artist'
  end

  def business?
    type == 'Business'
  end

end
