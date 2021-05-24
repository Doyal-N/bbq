class User < ApplicationRecord
  # Others available are: :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  has_many :events, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
  has_many :images

  validates :name, presence: true, length: { maximum: 15 }
  validates :avatar, content_type: ['image/png', 'image/jpg', 'image/jpeg'],
    dimension: { width: { min: 100, max: 200 }, height: { min: 100, max: 200 } }

  after_commit :link_subscriptions, on: :create

  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later
  end

  def creator?(model)
    id == model.user_id
  end

  private

  def link_subscriptions
    Subscription.where(user_id: nil, user_email: email).update_all(user_id: id)
  end
end
