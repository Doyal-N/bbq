class User < ApplicationRecord
  EMAIL = /\A\w+@\w+\.[a-z]+\z/.freeze

  has_many :events

  validates :name, :email, presence: true
  validates :name, length: { maximum: 30 }
  validates :email, length: { maximum: 100 }, uniqueness: true, format: { with: EMAIL }
end
