class AddCarrierimageToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :carrierimage, :string
  end
end
