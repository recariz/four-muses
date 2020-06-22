class Contest < ApplicationRecord
  belongs_to :user
  has_many :contest_tags, dependent: :destroy
  has_many :contest_applications, dependent: :destroy
  validates :start_date, :end_date, :location, :title, :content, presence: true
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_address?
end
