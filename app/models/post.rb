class Post < ApplicationRecord
	mount_uploader :carrierimage, ImageUploader
end
