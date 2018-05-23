class BeerComment < ApplicationRecord
  belongs_to :beers, through: :beer_comments
  belongs_to :comments, through: :beer_comments
end