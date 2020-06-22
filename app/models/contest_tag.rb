class ContestTag < ApplicationRecord
  belongs_to :category
  belongs_to :contest
end
