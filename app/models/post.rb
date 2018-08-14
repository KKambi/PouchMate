class Post < ApplicationRecord
	mount_uploader :carrierimage, ImageUploader

  # 화장품명,  DB에 저장X
  validates :title, :category, presence: true
end
