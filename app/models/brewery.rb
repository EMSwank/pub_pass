class Brewery < ApplicationRecord
  has_many :beers
  validates_presence_of :name, on: :create, message: "can't be blank"
  validates_presence_of :location, on: :create, message: "can't be blank"
end
