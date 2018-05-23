class Comment < ApplicationRecord
  belongs_to :user
  has_many :beer_comments
  has_many :beers, through: :beer_comments
end