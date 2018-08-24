class TablesController < ApplicationController
	before_action :authenticate_user!
  before_action :set_user_id, only: [:index]
   before_action :authenticate_user!
  before_action :set_friend, only: :destroy

	# GET /tables/:user_id
	def index
		@user = User.find(@user_id)
		@posts = @user.posts
		@post = Post.new
	  @items = Post.where(["title LIKE ?","%#{params[:search]}%"])
	  @friends = @user.friends
	  @cosmetics_num = @user.posts.count
	  @friends_num = @friends.count
	end

	# GET /tables/mypage
	def mypage
	end

	def comment_create
		@comment = TableComment.new
		@comment.user_id = params[:user_id]
		@comment.content = params[:table_comment][:content]
		@comment.save

		redirect_back fallback_location: request.referrer
	end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_id
      @user_id = params[:user_id]
    end
    def set_friend
    @friend = current_user.friends.find(params[:id])
  end
end
