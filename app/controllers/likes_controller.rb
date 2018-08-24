class LikesController < ApplicationController
	def like_toggle
        likecount= Like.where(user_id: current_user.id).count
	

          like = Like.find_by(user_id: current_user.id, post_id: params[:post_id])
		# else
  #           flash[:overlike] = "인생템이 5개를 초과하여 저장하지 못합니다."

  #       end

   

 #  if limitlike > 5
	# like.destroy


	if like.nil?
            Like.create(user_id: current_user.id, post_id: params[:post_id])   
    else
         like.destroy
    end
        redirect_back fallback_location: "/posts/show"


    # end
	end
end
