class TableComment < ApplicationRecord
	belongs_to :user

	# 댓글내용 없으면 DB에 저장X
  validates :content, presence: true
end
