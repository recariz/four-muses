class Contest < ApplicationRecord
  belongs_to :user
  has_many :contest_tags
  has_many :contest_applications
end
