class BeerComment < ApplicationRecord
  belongs_to :beers
  belongs_to :comments
end