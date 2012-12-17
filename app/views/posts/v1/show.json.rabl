object @post

attributes :id, :title, :content, :created_at, :user_name, :user_picture, :likes_size, :comments_size

child @post.comments => :comments do
	attributes :id, :content, :user_name
end