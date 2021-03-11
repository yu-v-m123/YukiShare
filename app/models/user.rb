class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_many :rooms, dependent: :destroy
  has_many :reservation, dependent: :destroy

  # validates :image presence: ture
  # validates :name presence: ture
  # validates : presence: ture
  mount_uploader :image, ImageUploader
end
