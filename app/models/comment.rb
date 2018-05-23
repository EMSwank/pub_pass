class Comment < ApplicationRecord
  belongs_to :user
  has_many :beer_comments
end