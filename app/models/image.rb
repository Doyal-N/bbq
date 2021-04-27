class Image < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :title, :image, presence: true
  validate :user_is_event_member

  has_one_attached :image

  private

  def user_is_event_member
    return if event.user_is_member?(user)

    errors.add(:user, :not_member)
  end
end
