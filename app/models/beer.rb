class Beer < ApplicationRecord
  validates_presence_of :name, :style
end
