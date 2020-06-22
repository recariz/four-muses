class Contest < ApplicationRecord
  belongs_to :user
  has_many :contest_tags, dependent: :destroy
  has_many :contest_applications, dependent: :destroy
  validates :start_date, :end_date, :location, :title, :content, presence: true
end
