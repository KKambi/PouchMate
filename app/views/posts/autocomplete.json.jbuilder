json.posts do 
	json.array!(@items) do |item|
		json.title item.title
		json.url post_path(item)
	end
end