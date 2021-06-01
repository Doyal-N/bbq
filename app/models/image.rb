# frozen_string_literal: true

class Image < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :title, :image, presence: true
  validate :user_is_event_member
  validates :image, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg'],
                    dimension: { width: { min: 200, max: 2000 }, height: { min: 200, max: 1400 } }

  has_one_attached :image

  private

  def user_is_event_member
    return if event.user_is_member?(user)

    errors.add(:user, :not_member)
  end
end
