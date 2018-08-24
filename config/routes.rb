Rails.application.routes.draw do
  root 'posts#title'

  # Table 라우팅
  get 'tables/index/:user_id' => 'tables#index', as: "tables"

  get 'tables/mypage'

  post 'tables/comments/create/:user_id' => 'tables#comment_create', as: "tables_comments_create"

  # Devise controller 관련 라우팅
  devise_for :users, controllers: { registrations: 'users/registrations', passwords: 'users/passwords', sessions: 'users/sessions' }

  #search 관련 라우팅
  get 'posts/search'
  get :search, controller: :posts
  



  # Post(화장품등록) 관련 라우팅 (REST)
  resources :posts do
    member do
      get :get_middle_categories, defaults: { format: "js" }
      get :get_small_categories, defaults: { format: "js" }
    end
  end

  # like 관련 라우팅
  post 'post/:post_id/like' => 'likes#like_toggle'

  

  # 친구 기능 라우팅  
  resources :friend_requests
  get 'friends/index'
  delete 'friends/destroy/:id' => 'friends#destroy', :as => 'friends_destroy'
  




end
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
