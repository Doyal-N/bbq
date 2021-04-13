class Event < ApplicationRecord
  belongs_to :user

  validates :title, :address, :datetime, presence: true
end
