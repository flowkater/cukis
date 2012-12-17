class Post < ActiveRecord::Base
	# 최신순 정렬
	default_scope order: 'created_at DESC'

	paginates_per 7
	
	attr_accessible :title, :content

	# comment
	has_many :comments, dependent: :destroy
	
	# like
	has_many :likes, dependent: :destroy

	# Picture polymorphic
  has_many :pictures, as: :imageable

	# formatting 된 created_at
	def created_at
		created_at.strftime("%Y. %m. %d.")
	end

	# like size
	def likes_size
		likes.size
	end

	def comments_size
		comments.size
	end
end
