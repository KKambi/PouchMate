class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception


	# 회원가입, 로그인, 로그아웃 시 특정 URL로 redirect하기 위한 메소드
	def after_sign_up_path_for(resource)
		if params[:redirect_to].present?
		  store_location_for(resource, params[:redirect_to])
		elsif request.referer == new_session_url
		  super
		else
		  store_location_for(resource) || request.referer || root_path
		end
	end

	def after_sign_in_path_for(resource)
		if params[:redirect_to].present?
		  store_location_for(resource, params[:redirect_to])
		elsif request.referer == new_session_url
		  super
		else
		  store_location_for(resource) || request.referer || root_path
		end
	end

	def after_sign_out_path_for(resource)
		if params[:redirect_to].present?
		  store_location_for(resource, params[:redirect_to])
		elsif request.referer == new_session_url
		  super
		else
		  store_location_for(resource) || request.referer || root_path
		end
	end



	# Devise field 추가 위한 override
	before_action :configure_permitted_parameters, if: :devise_controller?
	protected
      def configure_permitted_parameters
          devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :username, :nickname, :age, :gender, :password, :admin) }
          devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:nickname, :age, :gender, :password, :current_password) }
      end
end
