class ContestApplication < ApplicationRecord
  belongs_to :user
  belongs_to :contest
  validates :motivation, presence: true
  has_many_attached :photos, dependent: :destroy
  validates :photos, presence: true
  validates_uniqueness_of :user_id, scope: :contest_id

  enum status: [:pending, :accepted, :rejected]

end
