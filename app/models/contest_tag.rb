class ContestTag < ApplicationRecord
  belongs_to :category
  belongs_to :contest
  alidates_uniqueness_of :category_id, scope: :contest_id
end
