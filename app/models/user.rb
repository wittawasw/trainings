class User < ApplicationRecord
  has_secure_password

  has_many :courses

  validates :name, uniqueness: true

  def self.options_for_select
    pluck(:name, :id)
  end
end
