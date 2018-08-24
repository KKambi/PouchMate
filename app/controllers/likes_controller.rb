class LikesController < ApplicationController
	def like_toggle
		like = Like.find_by(user_id: current_user.id, post_id: params[:post_id])
		limitlike= Like.where(user_id: current_user.id).count
   

 #  if limitlike > 5
	# like.destroy

  else

	if like.nil?
         Like.create(user_id: current_user.id, post_id: params[:post_id])   
        else
         like.destroy
 
        end
    
        redirect_back fallback_location: "/posts/show"


    # end
	end
end
