class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

 
  # 프로필 사진 업로드할 수 있도록
  mount_uploader :profile_img, ProfileImgUploader

  #like
  
  has_many :likes
  has_many :liked_posts, through: :likes, source: :post


  # 1명의 User가 여러 화장품을 등록할 수 있도록
  has_many :posts, dependent: :destroy


  # 1명의 User가 여러 한줄평을 가질 수 있도록
  has_many :table_comments, dependent: :destroy



  # 친구신청 관련 N:N
  has_many :friend_requests, dependent: :destroy
  has_many :pending_friends, through: :friend_requests, source: :friend
  
  # 친구기능 관련 N:N
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships
  
  # 닉네임, 이름 넣지 않으면 DB에 저장X
  validates :nickname, :username, :age, :gender, presence: true
  
  # remove_friend는 User 클래스의 메소드이고, argument로 friend객체(=User객체)를 받는다.
  def remove_friend(friend)
    self.friends.destroy(friend)
  end


  def is_like? (post)
    Like.find_by(user_id: self.id, post_id: post.id).present?
  end
end
