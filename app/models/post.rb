class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :post_tags, dependent: :destroy
  has_many :categories, through: :post_tags
  validates :description, :title, presence: true
  has_many_attached :photos
end
