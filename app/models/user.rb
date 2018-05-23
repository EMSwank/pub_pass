class User < ApplicationRecord
  has_many :comments
  validates :username, uniqueness: true, presence: true
  validates_presence_of :password, require: true

  has_secure_password

  enum role: %w(default admin)
end