class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :post_tags, dependent: :destroy
  has_many :categories, through: :post_tags


  validates_presence_of :description, :title

  has_many_attached :photos

  acts_as_votable

end
