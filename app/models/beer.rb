class Beer < ApplicationRecord
  validates_presence_of :name, :style
  belongs_to :brewery
  has_many :beer_comments
end
