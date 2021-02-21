class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :rooms
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  # validates :password, on: :create
  # validates :username, presence: true
  # validates :image, presence: true
  # validates :introduction, presence: true

  mount_uploader :image, ImageUploader
end
