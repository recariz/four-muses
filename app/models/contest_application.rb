class ContestApplication < ApplicationRecord
  belongs_to :user
  belongs_to :contest
  validates :motivation, presence: true
  has_many_attached :photos
  validates :photos, length: {minimum:3}

enum status: [:pending, :accepted, :rejected]

end
