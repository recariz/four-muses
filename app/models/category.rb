class Category < ApplicationRecord
  validates :name, presence: true
  has_many :interests, dependent: :destroy
  has_many :post_tags
  has_many :posts, through: :post_tags
  has_many :contest_tags
  has_many :contests, through: :contest_tags
end
