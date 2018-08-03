class FriendRequestsController < ApplicationController
    before_action :set_friend_request, only: [:show, :edit, :update, :destroy]
    
    def index
        if user_signed_in?
            @incomings = FriendRequest.where(friend: current_user)
            @outgoings = current_user.friend_requests
        end
    end
    
    def new
    end
    
    def create
        friend = User.find(params[:friend_id])
        @friend_request = current_user.friend_requests.new(friend: friend)
        
        respond_to do |format|
          if @friend_request.save
            format.html { redirect_to friend_requests_path, notice: '친구 신청 완료!' }
            format.json { render :show, status: :created, location: @friend_request }
          else
            format.html { redirect_to friend_requests_path, notice: '친구 신청 실패!' }
            format.json { render json: @friend_request.errors, status: :unprocessable_entity }
          end
        end
    end
    
    def show
    end
    
    def edit
    end
    
    def destroy
        @friend_request.destroy
        head :no_content
    end
    
    def update
        @friend_request.accept
        head :no_content
    end



    private
    def set_friend_request
        @friend_request = FriendRequest.find(params[:id])
    end
end