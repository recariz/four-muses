class ContestTag < ApplicationRecord
  belongs_to :category
  belongs_to :contest
  validates_uniqueness_of :category_id, scope: :contest_id
end
