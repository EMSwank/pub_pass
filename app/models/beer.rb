class Beer < ApplicationRecord
  validates_presence_of :name, :style
  belongs_to :brewery
  has_many :beer_comments
  has_many :comments, through: :beer_comments
end
