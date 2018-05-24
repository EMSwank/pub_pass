class BeerComment < ApplicationRecord
  belongs_to :beer
  belongs_to :comment
end