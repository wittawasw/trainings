class User < ApplicationRecord
  has_secure_password

  has_many :courses

  validates :name, uniqueness: true
end
