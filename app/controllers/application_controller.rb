class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception


	# 회원가입, 로그인, 로그아웃 시 특정 URL로 redirect하기 위한 메소드 => devise controller로 옮김
	# def after_sign_up_path_for(resource)
	# 	tables_path(user_id: current_user.id)
	# end

	# def after_sign_in_path_for(resource)
 #  	tables_path(user_id: current_user.id)
	# end

	# def after_sign_out_path_for(resource)
	# 	root_path
	# end
	



	# Devise field 추가 위한 override
	before_action :configure_permitted_parameters, if: :devise_controller?
	protected
      def configure_permitted_parameters
          devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :username, :nickname, :age, :gender, :intro, :password, :password_confirmation, :admin, :profile_img) }
          devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:nickname, :age, :gender, :intro, :password, :current_password, :profile_img) }
      end
end
