class Subscription < ApplicationRecord
  belongs_to :event
  belongs_to :user, optional: true

  with_options if: -> { user.present? } do
    validates :user, uniqueness: { scope: :event_id }
  end

  with_options unless: -> { user.present? } do
    validates :user_name, presence: true
    validates :user_email, presence: true, format: { with: /\A\w+@\w+\.[a-z]+\z/ }
    validates :user_email, uniqueness: { scope: :event_id }
    validate :check_email_on_exists
  end

  def user_name
    user&.name || super
  end

  def user_email
    user&.email || super
  end

  private

  def check_email_on_exists
    return unless User.find_by(email: user_email)

    errors.add(:user_email, :taken_email)
  end
end
