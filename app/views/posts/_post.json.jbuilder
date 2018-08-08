json.extract! post, :id, :title, :memo, :img_url, :category, :open_date, :exp_date, :public, :user_id, :created_at, :updated_at , :carrierwave
json.url post_url(post, format: :json)
