class Room < ApplicationRecord
  belongs_to :user
  has_many :reservation, dependent: :destroy

  mount_uploader :room_image, ImageUploader
end
