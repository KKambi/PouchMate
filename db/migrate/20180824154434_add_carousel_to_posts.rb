class AddCarouselToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :carousel, :integer
  end
end
