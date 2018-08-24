class Post < ApplicationRecord
	mount_uploader :carrierimage, ImageUploader

	belongs_to :user
	has_many :likes
	has_many :liked_users, through: :likes, source: :user


  # 화장품명,  DB에 저장X
  validates :title, :category, :open_date, :exp_date, :public, :carousel, presence: true
end
