class Image < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :title, :image, presence: true
  validate :user_not_add_images

  has_one_attached :image

  private

  def user_not_add_images
    return if self.user.creator?(self.event)

    errors.add(:image, :not_add)
  end
end
