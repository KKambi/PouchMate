class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception


	# 회원가입, 로그인, 로그아웃 시 특정 URL로 redirect하기 위한 메소드
	def after_sign_up_path_for(resource)
		tables_path(user_id: current_user.id)
	end

	def after_sign_in_path_for(resource)
  	tables_path(user_id: current_user.id)
	end

	def after_sign_out_path_for(resource)
		root_path
	end

	def after_sign_out_path_for(resource)
		root_path
	end
	
# 지금 나머지 상황은 다 redirect되는데 회원정보 수정만 안됨
	# def after_update_path_for(resource)
	# 	flash[:notice] = "되냐?"
	# 	root
	# end


	# Devise field 추가 위한 override
	before_action :configure_permitted_parameters, if: :devise_controller?
	protected
      def configure_permitted_parameters
          devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :username, :nickname, :age, :gender, :password, :admin) }
          devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:nickname, :age, :gender, :password, :current_password) }
      end
end
