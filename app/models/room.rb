class Room < ApplicationRecord
  belongs_to :user
  has_many :reservation, dependent: :destroy

  mount_uploader :room_image, ImageUploader

  validates :room_name, presence: true
  validates :room_introduction, presence: true
  validates :room_price, presence: true
  validates :room_address, presence: true
  validates :room_image, presence: true
end
