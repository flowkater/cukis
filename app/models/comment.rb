class Comment < ActiveRecord::Base
	attr_accessible :content

	belongs_to :user
	belongs_to :post

	# formatting 된 created_at
	def created_at
		created_at.strftime("%Y. %m. %d.")
	end

	# 댓글 코멘트 작성자
	def user_name
		user.nickname		
	end
end
