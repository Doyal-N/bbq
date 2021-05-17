class Event < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
  has_many :subscribers, through: :subscriptions, source: :user
  has_many :images

  validates :title, :address, :datetime, presence: true
  validates :title, length: { maximum: 30 }

  def user_is_member?(user)
    subscribers.member?(user) || user&.creator?(self)
  end

  def true_pincode?(input_pin)
    pincode == input_pin
  end
end
