class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :content
      t.string :user_name
      t.string :user_picture

      t.timestamps
    end
  end
end
