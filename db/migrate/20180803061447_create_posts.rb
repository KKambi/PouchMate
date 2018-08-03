class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :memo
      t.string :img_url
      t.string :category
      t.date :open_date
      t.date :exp_date
      t.boolean :public
      t.integer :user_id

      t.timestamps
    end
  end
end
