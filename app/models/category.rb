class Category < ApplicationRecord
  validates :name, presence: true
  has_many :interests, dependent: :destroy
  has_many :posts, through: :categories
end
