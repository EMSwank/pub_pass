class Comment < ApplicationRecord
  belongs_to :user
  has_many :beer_comments
  belongs_to :beer
end