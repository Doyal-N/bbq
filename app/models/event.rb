class Event < ApplicationRecord
  belongs_to :user

  validates :title, :address, :datetime, presence: true
  validates :title, length: { maximum: 30 }
end
