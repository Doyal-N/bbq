class User < ApplicationRecord
  # Others available are: :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events, dependent: :destroy

  validates :name, length: { maximum: 15 }
end
