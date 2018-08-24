module ApplicationHelper
	# 디바이스 젬 그대로 모달에 복붙하면 생기는 문제 해결하는 코드
	def resource_name
    :user
  end

  def resource
    @user ||= User.new
  end
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end
