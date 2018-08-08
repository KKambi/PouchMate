class CreateTableComments < ActiveRecord::Migration[5.2]
  def change
    create_table :table_comments do |t|
      t.text :content
      t.integer :user_id

      t.timestamps
    end
  end
end
